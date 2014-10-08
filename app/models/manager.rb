class Manager < ActiveRecord::Base
  attr_accessible :user_attributes,:company_name,:first_name,:last_name,:company_email,:company_phone
  has_many :employees
  has_one :user
  accepts_nested_attributes_for :user
  

end
