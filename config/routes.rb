Rails.application.routes.draw do
    
  root 'home#home'
  get 'stations/index'
  get "/about", to: "home#about"
  get "/contact", to: "home#contact"

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations',  }
  resources :users, :identities, :bike_networks, :bike_stations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
