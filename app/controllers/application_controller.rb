class ApplicationController < ActionController::Base

  protect_from_forgery
  include UrlHelper
  def after_sign_in_path_for(resource)    
    if request.subdomain.blank? || request.subdomain=="www"
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
