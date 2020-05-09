class ShipmentsController < ApplicationController

    def new
        Service.find_by_id(params[:id])
        @shipment = @service.build_shipment
    end

    def create

    end

end
