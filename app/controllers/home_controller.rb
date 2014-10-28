class HomeController < ApplicationController
  def index
    @users=User.all
    unless current_user
      render "index"
    else if current_user.employee
    redirect_to shift_employees_path
    else 
      redirect_to new_manager_employee_path(current_user)
     end
    end
  end
  
  def detail_and_pricing
    
  end
end
