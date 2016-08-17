ImpactTravel::Engine.routes.draw do
  resource :landing
  resources :sessions
  resource :home
  resource :searches
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
