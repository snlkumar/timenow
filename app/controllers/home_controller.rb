class HomeController < ApplicationController
  def index
    @users=User.all
    unless current_user
      render "index"
    else if current_user.employee
    redirect_to shift_employees_path
    else
      render "index"
    end
    end
  end
  
  def detail_and_pricing
    
  end
end
