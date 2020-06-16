class CarriersController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index   
        @results = 0 # We set our results variable to 0 everytime we visit the index page. We will use this as a counter in our search.

        if params[:query] # First, we check and see if there are any user parameters present in our text_field under 'views/carriers/index'.
            @carriers = Carrier.find_carrier(params[:query]) # If there are, we search the database with our scope method to see if the parameters return a result.
        else # However, if no user parameters are present...
            @carriers = Carrier.all # ...we simply return all of the carriers present in the database.
        end
    end


end
