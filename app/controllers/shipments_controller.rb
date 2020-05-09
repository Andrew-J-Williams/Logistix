class ShipmentsController < ApplicationController

    def new
        @service = Service.find_by_id(params[:service_id])
        @shipment = @service.shipments.build
    end

    def create
        @shipment = Shipment.new(shipment_params)
        
        if @shipment.save
            redirect_to shipment_path(@shipment)
        else
            redirect_to :new
        end
    end

    def index
        @shipments = Shipment.all
    end

    private

    def shipment_params
        params.require(:shipment).permit(:customer, :address, :contact, :total_weight, :ship_date, :tracking_number ,:status, :service_id)
    end

end
