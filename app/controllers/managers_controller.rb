class ManagersController < ApplicationController
  def new
    @manager=Manager.new
    @manager.build_user
  end
  
end
