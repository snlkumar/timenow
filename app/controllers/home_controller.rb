class HomeController < ApplicationController
  def index
    @users = User.all
  end
  
  def detail_and_pricing
    
  end
end
