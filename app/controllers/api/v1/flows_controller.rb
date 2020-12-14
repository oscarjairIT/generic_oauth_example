class Api::V1::FlowsController < ApiController

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

    # Recieves code and Request Token
    def get_token
        render json: @flows = token_request(params[:code]) and return if params[:code]
        render json: @flows, status: :bad_request
    end

    private 

    def token_request(code)
        result = HTTParty.get("https://github.com/login/oauth/access_token",
            :body => {
                :client_id => "de397562547f887d471f",
                :client_secret => "31001ef7542705850702c2a7f2edabc49b5467c2",
                :code => code
            }.to_json,
            :headers => {
            "Content-Type" => "application/json",
            "Accept" => "application/json"
        }) 
        result = result.parsed_response
        return result
    end
    
    def flows_params
        params.require(:flows).permit(:platform)
    end
end
