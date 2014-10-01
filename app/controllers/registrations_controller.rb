class RegistrationsController < Devise::RegistrationsController
  
  
     
  protected
    def after_sign_up_path_for(resource)     
      resource.update_attributes(subdomain: request.subdomain) unless request.subdomain.blank?
      sign_in resource
      flash[:success]="Successfully signup"
      root_url(:subdomain => resource.name)
    end
    
    
end

