class UsersController < ApplicationController

    def new
        @user = User.new
        # Routes user to our 'sign up' screen.
    end

    def create
        @user = User.new(user_params) #The user info from our "new.html.erb" view is posted here. User_params is defined as a private method.
        if @user.save # If our user validates correctly...
            session[:user_id] = @user.id # We set our session's equal to the user's id
            redirect_to user_path(@user) # and then redirect this user to a different page.
        else # But if our user does not validate...
            render :new # they are sent back to the sign up page.
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id]) # Checks for user id.
        @shipments = Shipment.sort_by_date
        redirect_to '/' if !@user 
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
        # We first require our object that comes through our params...
        # Then we permit any other params we desire. 
    end

end
