class UsersController < ApplicationController
 before_filter :login_required
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
