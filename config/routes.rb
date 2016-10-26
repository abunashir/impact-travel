ImpactTravel::Engine.routes.draw do
  root "landings#show"

  resource :landing
  resources :sessions
  resource :home
  resources :destinations

  resources :searches do
    resources :results do
      resources :bookings, only: [:new, :create]
    end
  end

  resources :bookings, except: [:new, :create]
  resources :condos
  resources :hotels
  resources :cruises
  resource :shopping
  resources :cars
  resources :tours
  resources :packages
  resources :wellnesses
  resource :account do
    resource :activation
    resource :password, only: [:edit, :update]
  end

  resources :supplementaries
  resource :contact
  resource :about

  resource :password do
    resources :resets
  end
end
