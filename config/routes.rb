Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :flows
    end
  end
end
