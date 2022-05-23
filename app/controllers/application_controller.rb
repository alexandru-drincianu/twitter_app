class ApplicationController < ActionController::Base
    include SessionsHelper
    def hello 
        if logged_in?
            redirect_to users_path
        else
            redirect_to login_path
        end
    end

    def check_user
        redirect_to login_path unless logged_in?
    end

    def admin_user
        redirect_to root_path unless current_user.admin?
    end
    
end
