class ServicesController < ApplicationController
    def index
        redirect_if_not_logged_in
        @services = Service.all
        @carriers = Carrier.all 
    end

    def show
        redirect_if_not_logged_in
        @service = Service.find(params[:id])
        @shipments = Shipment.all
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

    private

    def service_params
        params.require(:service).permit(:name, :carrier_id, carrier_attributes: [:name, :phone])
    end
end
