class SessionsController < ApplicationController

    def welcome
        #redirect_if_logged_in
    end

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username]) # Find_by will not throw an error
        authenticated = @user.try(:authenticate, params[:user][:password]) # Variable that checks to see if the password entered is associated with the username.
        if authenticated # If the username/password key/value pair are correct...
            session[:user_id] = @user.id # The session is set equal to the user's id...
            redirect_to user_path(@user) # and the user is sent to their show page.
        else # But if the pair does not match...
            flash[:error] = "Invalid login. Please try again."
            redirect_to login_path # The user is redirected to the log in page.
        end
    end

    def destroy
        session.delete(:user_id) # We pass in our user's id and remove it from the current session...
        redirect_to '/' # we then send the user back to our welcome screen.
    end

end