class ServicesController < ApplicationController
   
    def new
        @service = Service.new
        @service.build_carrier
    end

    def create
        @service = Service.new(service_params)
        if @service.save
            redirect_to service_path(@service)
        else
            @service.build_carrier
            render :new
        end
    end
    
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

    def destroy
        @service = Service.find(params[:id])
        
        @service.delete
        redirect_to services_path
    end

    private

    def service_params
        params.require(:service).permit(:name, :carrier_id, carrier_attributes: [:name, :phone])
    end
end
