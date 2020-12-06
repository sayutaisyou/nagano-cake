class ApplicationController < ActionController::Base
    
    
    
    def after_sign_in_path_for(resource)
        if customer_signed_in?
            customers_homes_top_path
        else
            admins_homes_top_path
        end
    end
    
    def after_sign_out_path_for(resource)
        customers_homes_top_path
    end
    
end
