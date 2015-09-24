Rails.application.routes.draw do
  get  '/auth/instagram/callback', to: 'sessions#create'
  resources :users, only: [:index, :show]
  get '/logout',                   to: 'sessions#destroy'
  root 'static_pages#index'


end
