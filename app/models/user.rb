class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates_presence_of :email
  validates_presence_of :encrypted_password
  # belongs_to :manager
  # belongs_to :employe
  validates_presence_of :name
  validates_format_of :name, with: /^[a-z0-9_]+$/, message: 'must be lowercase alphanumerics only'
  validates_length_of :name, maximum: 32, message: 'exceeds maximum of 32 characters'
  validates_exclusion_of :name, in: ['www', 'mail', 'ftp'], message: 'is not available'
  attr_accessible :name,:employe,:manager, :email,:subdomain, :password, :password_confirmation, :remember_me, :created_at, :updated_at
  
end
