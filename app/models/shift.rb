class Shift < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude,:start_time,:shift_hours,:end_time,:date,:employee_id
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode 
  belongs_to :employee  
end
