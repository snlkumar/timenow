class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  # field :subdomain, :type=>String
  
  ## Rememberable
 

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # run 'rake db:mongoid:create_indexes' to create indexes
  # index({ email: 1 }, { unique: true, background: true })
  # field :name, :type => String
  validates_presence_of :name
  validates_format_of :name, with: /^[a-z0-9_]+$/, message: 'must be lowercase alphanumerics only'
  validates_length_of :name, maximum: 32, message: 'exceeds maximum of 32 characters'
  validates_exclusion_of :name, in: ['www', 'mail', 'ftp'], message: 'is not available'
  attr_accessible :name, :email,:subdomain, :password, :password_confirmation, :remember_me, :created_at, :updated_at
  
end
