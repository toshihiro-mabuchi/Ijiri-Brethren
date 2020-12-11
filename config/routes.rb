Rails.application.routes.draw do
  get 'movies/new'
  root 'home_page#index'
  
  resources :movies, only: [:index, :new, :create,:edit ,:update, :destroy]
end
