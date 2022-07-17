class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    before_action :require_login
    def current_user
        User.find_by(id: session[:user_id])
    end
    def logged_in?
        
        !current_user.nil?
    end

    def require_login
        redirect_to welcome_path unless logged_in?
    end
   

end
