class ApplicationController < ActionController::Base
 
  protect_from_forgery
    
    def after_sign_in_path_for(resource)
      unless resource.subdomain == request.subdomain       
         reset_session
         flash[:alert]="Invalid sub Domain"
         flash[:notice]=nil
         root_url(:host => request.domain)       
      end
    end
    def after_sign_out_path_for(resource)
      root_url(:host => request.domain)
    end
#   
  
end
