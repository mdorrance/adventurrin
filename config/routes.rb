Rails.application.routes.draw do
  get  '/auth/instagram/callback', to: 'sessions#create'
  resources :users, only: [:index, :show]
  get '/location_search',          to: 'users#location_search'
  get '/logout',                   to: 'sessions#destroy'
  root 'static_pages#index'


end
