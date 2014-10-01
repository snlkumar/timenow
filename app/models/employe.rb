class Employe < ActiveRecord::Base
  attr_accessible :user,:manager_id,:user_attributes
  has_one :user
  belongs_to :manager
  accepts_nested_attributes_for :user
end
