Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get '/flows_to', to: 'flows#flow_to'
      get '/flows_token', to: 'flows#get_token'
      resources :flows
    end
  end

  

end
