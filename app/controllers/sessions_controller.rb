class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def destroy
        session.delete(:user_id) # We pass in our user's id and remove it from the current session...
        redirect_to '/' # we then send the user back to our welcome screen.
    end

end