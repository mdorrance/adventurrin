Rails.application.routes.draw do
  get  '/auth/instagram/callback', to: 'sessions#create'
  get 'feed',                      to: 'users#index'
  get 'profile',                   to: 'users#show'
  resources :adventures, only: [:create, :destroy]
  get '/locations',                to: 'users#location_search'
  get '/logout',                   to: 'sessions#destroy'
  root 'static_pages#index'


end
