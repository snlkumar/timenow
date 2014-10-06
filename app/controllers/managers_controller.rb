class ManagersController < ApplicationController
  def new
    @manager=Manager.new
   @user= @manager.build_user
  end
  
  def create
   
    @manager=Manager.new params[:manager]
    if @manager.save
    redirect_to root_path(:host=>request.domain)
    else
      render "new"
    end
  end
  
end
