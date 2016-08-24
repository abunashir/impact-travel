ImpactTravel::Engine.routes.draw do
  resource :landing
  resources :sessions
  resource :home
  resources :destinations
  resources :searches
  resources :condos
  resources :hotels
  resources :cruises
  resource :shopping
  resources :cars
  resources :tours
  resources :packages
  resources :wellnesses
  resource :account
end
