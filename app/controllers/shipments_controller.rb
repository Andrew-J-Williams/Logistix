class ShipmentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_shipment

    def new
        if @service = Service.find_by_id(params[:service_id])
            @service = Service.find_by_id(params[:service_id])
            @shipment = @service.shipments.build
        else    
            @shipment = Shipment.new
        end 
    end

    def create
        @shipment = current_user.shipments.build(shipment_params)
        if @shipment.save
            redirect_to shipment_path(@shipment)
        else
            render :new
        end
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
        if @shipment.user_id != session[:user_id]
            flash[:message] = "You do not have access to view all parameters."
            redirect_to shipment_path(@shipment)
        end
    end

    def update
        #@shipment.update(shipment_params) && @shipment.user_id == session[:user_id]
        if current_user.shipments.update(shipment_params)
            redirect_to shipment_path(@shipment)
        else
            render :edit
        end
    end

    private

    def shipment_params
        params.require(:shipment).permit(:customer, :address, :contact, :total_weight, :ship_date, :tracking_number ,:status, :service_id)
    end

    def set_shipment
        @shipment = Shipment.find_by_id(params[:id])
    end

end
