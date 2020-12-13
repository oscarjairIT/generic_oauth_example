class Api::V1::FlowsController < ApplicationController

    # Returns access credentials from .env
    def index
        render json: @flows = "Flow#{params[:platform]}".constantize.get_credentials() and return if params[:platform].present?
        render json: @flows, status: :bad_request
    end

    # Redirect to :platform OAuth
    def flow_to
        redirect_to "Flow#{params[:platform]}".constantize.redirect() and return if params[:platform].present?
        render json: @flows, status: :bad_request
    end

    private 
    
    def flows_params
        params.require(:flows).permit(:platform)
    end
end
