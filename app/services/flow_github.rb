class FlowGithub < ApplicationService

    def initialize
        @client_id = ENV["GITHUB_CLIENTID"]
        @client_secret = ENV["GITHUB_SECRETID"]
        @auth_url = ENV["GITHUB_AUTH_URL"]
        @token_url = ENV["GITHUB_TOKEN_URL"]
        @callback_url = ENV["CALLBACK_URL"]
    end

    def redirect
        redirection = @auth_url+"?client_id="+@client_id+"&redirect_uri="+@callback_url
        return redirection
    end

    def get_credentials
        return credentials = {
            :client_id => @client_id ,
            :client_secret => @client_secret
        }
    end
end