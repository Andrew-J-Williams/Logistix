class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? # Defining our helper methods.

    private

    def logged_in? # This method checks to see if the session contain's the current user's id, returning a true/false value.
        !!session[:user_id]
    end
    
    def current_user # Method checks to see what the current user's id is IF there is a user id present in the session.
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in # Method prevents a user who is not logged in from seeing webpages on the site, sending them back to the 'login screen'
        redirect_to login_path if !logged_in?
    end

    #def redirect_if_logged_in # Method added by personal preference, redirects user to their homepage when they first arrive at the site.
    #    redirect_to user_path(current_user)
    #end

end
