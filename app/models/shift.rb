class Shift < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude,:start_time,:end_time,:date
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode 
  belongs_to :employee
  before_create :update_employee
  
  def upadate_employee
    self.employee=current_user
  end
end
