class ServicesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :find_service
   
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
        @services = Service.sort_service
        @carriers = Carrier.all 
    end

    def show
        @shipments = Shipment.all
    end

    def edit
    end

    def update
        if @service.update(service_params)
            redirect_to service_path(@service)
        else
            render :edit
        end
    end

    private

    def service_params
        params.require(:service).permit(:name, :carrier_id, carrier_attributes: [:name, :phone])
    end

    def find_service
        @service = Service.find_by_id(params[:id])
    end
end
