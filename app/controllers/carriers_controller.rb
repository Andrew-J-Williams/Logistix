class CarriersController < ApplicationController

    def new
        @carrier = Carrier.new
    end

    def create
        @carrier = Carrier.new(carrier_params)
        if @carrier.save

        else
            redirect_to new_carrier_path
    end

    private

    def carrier_params
        params.require(:carrier).permit(:name, :phone)
    end

end
