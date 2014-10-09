class ShiftsController < ApplicationController
  def new
    @shift=Shift.new
  end
  
  def create
    @shift=Shift.new(params[:shift])
    @shift.save
    redirect_to shifts_path(:id=>@shift)
  end
  
  def index
    @shift=Shift.find params[:id]
  end
  
end
