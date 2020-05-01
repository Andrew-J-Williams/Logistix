class UsersController < ApplicationController

    def new
        @user = User.new
        # Routes user to our 'sign up' screen.
    end

end
