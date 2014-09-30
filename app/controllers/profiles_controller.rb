class ProfilesController < ApplicationController
  def show
    unless current_user
    redirect_to "#{request.url}users/sign_in"
    else
      @user = User.where(:name => request.subdomain).first || not_found
    end
  end
  
  def not_found
    raise ActionController::RoutingError.new('User Not Found')
  end
end