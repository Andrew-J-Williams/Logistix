class ShipmentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_shipment

    def new
        if @service = Service.find_by_id(params[:service_id])
            @shipment = @service.shipments.build
        else    
            @shipment = Shipment.new
        end 
    end

    def create
        @shipment = current_user.shipments.build(shipment_params)
        save_shipment
    end

    def show
    end

    def index
        if @service = Service.find_by_id(params[:service_id])
            @shipments = @service.shipments
        else    
            @shipments = Shipment.sort_shipments
        end
    end

    def edit
        if !user_shipment
            flash[:error] = "You do not have access to view all parameters."
            redirect_to shipment_path(@shipment)
        end
    end

    def update
        @shipment.update(shipment_params) && user_shipment
        save_shipment
    end



    private

    def shipment_params
        params.require(:shipment).permit(:customer, :address, :contact, :total_weight, :ship_date, :tracking_number ,:status, :service_id)
    end

    def set_shipment
        @shipment = Shipment.find_by_id(params[:id])
    end

    def save_shipment
        if @shipment.save
            redirect_to shipment_path(@shipment)
        else
            render :new
        end
    end

    def user_shipment
        @shipment.user_id == session[:user_id]
    end

end
