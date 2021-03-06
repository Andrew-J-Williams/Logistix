class SessionsController < ApplicationController

    def welcome
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def new
    end

    def create
        if params[:provider] == 'google_oauth2' 
            @user = User.generate_from_google_omni(auth) # Utilizes ourc class method defined in the User model

            set_session # The session is set equal to the user's id, then we are redirected to the user's profile.
        else
            @user = User.find_by(username: params[:user][:username]) # Scope method here will check to see if our username matches the input 
            authenticated = @user.try(:authenticate, params[:user][:password]) # Variable that checks to see if the password entered is associated with the username.
            if authenticated # If the username/password key/value pair are correct...
                set_session # The session is set equal to the user's id, and the user is sent to their show page.
            else # But if the pair does not match...
                flash[:error] = "Invalid login. Please try again."
                redirect_to login_path # The user is redirected to the log in page.
            end
        end
    end

    def destroy
        session.delete(:user_id) # We pass in our user's id and remove it from the current session...
        redirect_to '/' # we then send the user back to our welcome screen.
    end

    def omniauth
        @user = User.generate_from_google_omni(auth) # Utilizes our class method defined in the User model

        set_session # The session is set equal to the user's id, then we are redirected to the user's profile.
    end

    private

    def auth # Gives us access to the information necessary to login with Omniauth
      request.env['omniauth.auth']
    end

    def set_session
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end

end