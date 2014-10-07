class ApplicationController < ActionController::Base

  protect_from_forgery
  include UrlHelper
  def after_sign_in_path_for(resource)
    puts "the request#{request.subdomain} and current user#{current_user}"
    if request.subdomain.blank? || request.subdomain=="www"
      puts "the current user is#{current_user} and #{resource.subdomain}"      # sign_in(resource)
      
      root_url(:subdomain => current_user.subdomain)
    else if resource.subdomain != request.subdomain
        reset_session
        flash[:alert]="Invalid sub Domain"
        flash[:notice]=nil
        root_url(:host => request.domain)
      end
    end

  end

  def after_sign_out_path_for(resource)
    # sign_out(resource)
    root_url(:host => request.domain)
  end
#

end
