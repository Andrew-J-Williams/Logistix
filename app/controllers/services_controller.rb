class ServicesController < ApplicationController
    def index
        @services = Service.all
    end
    
    def new
        @service = Service.new
        @service.build_carrier
    end

    def create
        @service = Service.new(service_params)
        if @service.save
            redirect_to service_path(@service)
        else
            render :new
        end
    end

    def show
        @service = 
    end

    private

    def service_params
        params.require(:service).permit(:name, :carrier_id, carrier_attributes: [:name, :phone])
    end
end
