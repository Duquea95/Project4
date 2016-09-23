Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations',  }
  root 'home#index'
  # root 'setup#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
