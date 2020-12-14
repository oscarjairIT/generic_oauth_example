# docs: https://docs.github.com/en/free-pro-team@latest/developers/apps/authorizing-oauth-apps
class FlowGithub < ApplicationService
    attr_reader :code

    def initialize(code)
        @code = code
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

    def get_token
        result = HTTParty.get(@token_url,
            :body => {
                :client_id => @client_id,
                :client_secret => @client_secret,
                :code => @code
            }.to_json,
            :headers => {
            "Content-Type" => "application/json",
            "Accept" => "application/json"
        }) 
        result = result.parsed_response
        return result
    end
end