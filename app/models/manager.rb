class Manager < ActiveRecord::Base
  attr_accessible :title, :body,:user_attributes
  has_many :employees
  has_one :user
  accepts_nested_attributes_for :user
end
