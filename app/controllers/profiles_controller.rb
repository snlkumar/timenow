class ProfilesController < ApplicationController
  # before_filter :authenticate_user!
  def show
    
    puts "i am in show with the following current user#{current_user}"
    unless current_user
     root_url(:host => request.domain)
    else
      @user = User.where(:name => request.subdomain).first || not_found
    end
  end
  
  def not_found
    raise ActionController::RoutingError.new('User Not Found')
  end
end