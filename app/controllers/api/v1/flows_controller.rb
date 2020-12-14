class Api::V1::FlowsController < ApiController

    # Returns access credentials from .env
    def index
        render json: @flows = "Flow#{params[:platform]}".constantize.get_credentials(nil) and return if params[:platform].present?
        render json: @flows, status: :bad_request
    end

    # Redirect to :platform OAuth
    def flow_to
        redirect_to "Flow#{params[:platform]}".constantize.redirect(nil) and return if params[:platform].present?
        render json: @flows, status: :bad_request
    end

    # Recieves code and Request Token
    def get_token
        render json: @flows = "Flow#{params[:platform]}".constantize.get_token(params[:code]) and return if params[:code] && params[:platform]
        render json: @flows, status: :bad_request
    end

    private
    
    def flows_params
        params.require(:flows).permit(:platform, :code)
    end
end
