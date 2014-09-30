class RegistrationsController < Devise::RegistrationsController
  protected
    def after_sign_up_path_for(resource)
      puts "i am after signup with #{request.subdomain}"
      root_url(:subdomain => resource.name)
    end
    
    def after_sign_in_path_for(resource)
      
    end
    
    
end

