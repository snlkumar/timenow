class EmployeesController < ApplicationController
  
  def new
    @manager=current_user.manager
    @employe=Employee.new
    @employe.build_user
  end
  
  def create
   @manager=current_user.manager
    @employe=Employee.new params[:employee]
    if @employe.save
    redirect_to root_path(:host=>request.domain)
    else      
      render "new"
    end
  end
  
  def shift
    
  end
  
end
