# docs: - https://developers.google.com/identity/protocols/oauth2/web-server#example
#       - https://developers.google.com/identity/protocols/oauth2/scopes
class FlowGoogle < ApplicationService
    attr_reader :code

    def initialize(code)
        @code = code
        @client_id = ENV["GOOGLE_CLIENTID"]
        @client_secret = ENV["GOOGLE_SECRETID"]
        @auth_url = ENV["GOOGLE_AUTH_URL"]
        @token_url = ENV["GOOGLE_TOKEN_URL"]
        @callback_url = ENV["GOOGLE_CALLBACK_URL"]
        @scope = ENV["GOOGLE_SCOPE"]
    end

    def redirect
        redirection = @auth_url+"?client_id="+@client_id+"&redirect_uri="+@callback_url+"&response_type=code"+"&scope="+@scope
        return redirection
    end

    def get_credentials
        return credentials = {
            :client_id => @client_id ,
            :client_secret => @client_secret
        }
    end

    def get_token
        result = HTTParty.post(@token_url,
            :body => {
                :client_id => @client_id,
                :client_secret => @client_secret,
                :code => @code,
                :grant_type => 'authorization_code',
                :redirect_uri => @callback_url
            }.to_json,
            :headers => {
            "Content-Type" => "application/json",
            "Accept" => "application/json"
        }) 
        result = result.parsed_response
        return result
    end
end