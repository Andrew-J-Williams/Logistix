class ShipmentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if @service = Service.find_by_id(params[:service_id])
            #@service = Service.find_by_id(params[:service_id])
            @shipment = @service.shipments.build
        else    
            @shipment = Shipment.new
        end 
    end

    def create
        @shipment = Shipment.new(shipment_params)
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
        @shipments = Shipment.all.sort_shipments
    end

    def edit
        @shipment = Shipment.find_by_id(params[:id])
        if @shipment.user_id != session[:user_id]
            render :show
        end
    end

    def update
        @shipment = Shipment.find_by_id(params[:id])
        if @shipment.update(shipment_params) && @shipment.user_id == session[:user_id]
            redirect_to shipment_path(@shipment)
        else
            render :edit
        end
    end

    private

    def shipment_params
        params.require(:shipment).permit(:customer, :address, :contact, :total_weight, :ship_date, :tracking_number ,:status, :service_id)
    end

end
