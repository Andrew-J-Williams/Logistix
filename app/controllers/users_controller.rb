class UsersController < ApplicationController

    def new
        @user = User.new
        # Routes user to our 'sign up' screen.
    end

    def create
        @user = User.new(user_params) #The user info from our "new.html.erb" view is posted here.
        if @user.save # If our user validates correctly...
            session[:user_id] = @user.id # We set our session's equal to the user's id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show

    end

    private

    def user_params
        params.require()
    end

end
