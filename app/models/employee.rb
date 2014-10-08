class Employee < ActiveRecord::Base
  attr_accessible :user,:manager_id,:user_attributes,:designation,:first_name,:last_name,:gender,:emp_code,:phone
  has_one :user
  belongs_to :manager
  accepts_nested_attributes_for :user
end
