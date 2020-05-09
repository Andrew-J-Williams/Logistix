class ShipmentsController < ApplicationController

    def new
        @service = Service.find_by_id(params[:service_id])
        @shipment = @service.shipments.build
    end

    def create
        @shipment = Shipment.new(shipment_params)
        # @shipment = current_user.shipments.build(shipment_params)
        @shipment.user_id = session[:user_id]
        if @shipment.save
            redirect_to shipment_path(@shipment)
        else
            render :new
        end
    end

    def show
        @shipment = Shipment.find_by_id(params[:id])
    end

    def index
        @shipments = Shipment.all
    end

    private

    def shipment_params
        params.require(:shipment).permit(:customer, :address, :contact, :total_weight, :ship_date, :tracking_number ,:status, :service_id)
    end

end
