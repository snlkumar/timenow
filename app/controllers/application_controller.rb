class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_valid_domain
  
  
  
  def check_valid_domain
    puts "#{request.url}"
  end
    
  
  
end
