class ApplicationController < ActionController::Base
 
  protect_from_forgery
    
    def after_sign_in_path_for(resource)
      unless resource.subdomain == request.subdomain
        flash[:error]= 'Invalid subdomain.'
         reset_session
      end
     
      root_path
    end
    # def after_sign_out_path_for(resource)
      # puts "i am in after signout path"
      # root_path
    # end
#   
  
end
