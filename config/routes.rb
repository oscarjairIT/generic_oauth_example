Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get '/flows_to', to: 'flows#flow_to'
      resources :flows
    end
  end
end
