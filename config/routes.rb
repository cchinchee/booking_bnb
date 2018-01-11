Rails.application.routes.draw do
  root "welcome#index"
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :show, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    resources :listings do
      resources :reservations 
  end
end
  # get '/users/:id' => 'users#show', as: 'user'

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"



  get "/listings/new" => "listings#new"
  post "/listings" => "listings#create"
  
  delete "/users/:user_id/listings/:id" =>"listings#destroy"
  get "/listings" => "listings#draft_listings"
  get "/listings/verified" =>"listings#verified_listings"

  get "/listings/:id" => "listings#show"
  
  post "/listings/:id/verify" =>"listings#verify"
  post "/users/:user_id/listings/:id" => "listings#update_listing"
  get "/users/:id/media" => "users#media"

  get "/reservations/:id/payment" => "reservations#payment"
  post "/reservations/:id/payment/checkout" => "reservations#checkout"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


