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
    @total_time = Time.now.change(:hour => 00 , :minute => 00, :second => 00)
    puts "the total time is #{@total_time}"
    @employee = current_user.employee
    @shifts = @employee.shifts.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)
    @shifts.each do |shift|
      
    end
    @total_time.strftime("%H:%M")
  end
  
end
