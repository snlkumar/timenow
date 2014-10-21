class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
   belongs_to :manager
   belongs_to :employee
   validates_presence_of :email
  validates_presence_of :encrypted_password 
  validates_presence_of :name
  validates_format_of :name, with: /^[a-z0-9_]+$/, message: 'must be lowercase alphanumerics only'
  validates_length_of :name, maximum: 32, message: 'exceeds maximum of 32 characters'
  validates_exclusion_of :name, in: ['www', 'mail', 'ftp'], message: 'is not available'
  attr_accessible :name,:employe,:manager, :email,:subdomain, :password, :password_confirmation,:stripe_token, :coupon, :remember_me, :created_at, :updated_at
  attr_accessor :stripe_token, :coupon
  # before_save :update_stripe,:if => Proc.new {|model| model.manager }
  after_create :update_subdomain 
  before_destroy :cancel_subscription
  
  
  def update_subdomain
    if self.manager
    User.update(self.id,:subdomain=>self.manager.company_name)
    else
      User.update(self.id,:subdomain=>self.employee.manager.user.subdomain)
      end 
  end
  
  def update_plan(role)
    self.role_ids = []
    self.add_role(role.name)
    unless customer_id.nil?
      customer = Stripe::Customer.retrieve(customer_id)
      customer.update_subscription(:plan => role.name)
    end
    true
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "Unable to update your subscription. #{e.message}."
    false
  end
  
  def update_stripe
    return if email.include?(ENV['ADMIN_EMAIL'])
    return if email.include?('@example.com') and not Rails.env.production?
    if customer_id.nil?
      if !stripe_token.present?
        raise "Stripe token not present. Can't create account."
      end
      if coupon.blank?
        customer = Stripe::Customer.create(
          :email => email,
          :description => name,
          :card => stripe_token,
          :plan => "silver"
        )
      else
        customer = Stripe::Customer.create(
          :email => email,
          :description => name,
          :card => stripe_token,
          :plan => "Silver",
          :coupon => coupon
        )
      end
    else
      customer = Stripe::Customer.retrieve(customer_id)
      if stripe_token.present?
        customer.card = stripe_token
      end
      customer.email = email
      customer.description = name
      customer.save
    end
    self.last_4_digits = customer.cards.data.first["last4"]
    self.customer_id = customer.id
    self.stripe_token = nil
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "#{e.message}."
    self.stripe_token = nil
    false
  end
  
  def cancel_subscription
    unless customer_id.nil?
      customer = Stripe::Customer.retrieve(customer_id)
      unless customer.nil? or customer.respond_to?('deleted')
        subscription = customer.subscriptions.data[0]
        if subscription.status == 'active'
          customer.cancel_subscription
        end
      end
    end
  rescue Stripe::StripeError => e
    logger.error "Stripe Error: " + e.message
    errors.add :base, "Unable to cancel your subscription. #{e.message}."
    false
  end
  
  def expire
    UserMailer.expire_email(self).deliver
    destroy
  end
  
  
end
