class Employee < ActiveRecord::Base
  attr_accessible :user,:manager_id,:user_attributes,:designation,:first_name,:last_name,:gender,:emp_code,:phone
  has_one :user
  has_many :shifts
  belongs_to :manager
  accepts_nested_attributes_for :user
  validates_presence_of :first_name,:last_name
  validates_format_of :first_name,:last_name, with: /^[a-z0-9_]+$/, message: 'must be lowercase alphanumerics only'
  validates_length_of :first_name,:last_name, maximum: 32, message: 'exceeds maximum of 32 characters'
  validates_exclusion_of :first_name,:last_name, in: ['www', 'mail', 'ftp'], message: 'is not available'
  def checked_in?
    if self.shifts.last
      self.shifts.last.end_time.blank?
    else
      nil
    end
  end

  def checked_out?
    if self.shifts.last
      !self.shifts.last.end_time.blank?
    else
      nil
    end
  end

end
