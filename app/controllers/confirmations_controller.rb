class ConfirmationsController < Devise::ConfirmationsController
  protected
    def after_confirmation_path_for(resource_name, resource)
      puts "i am in confir"
      root_url(:subdomain => resource.subdomain)
    end
end
