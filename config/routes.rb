Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "homepage#show"

  namespace :api do
    namespace :v1 do
      get "forecast", to: "forecast#show"
      get "backgrounds", to: "backgrounds#show"
      post "/users", to: "users#create"
      get "/foodie", to: "foodie#index"
      post "/sessions", to: "users#show"
      post "/road_trip", to: "road_trip#show"
    end
  end

end
