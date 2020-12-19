Rails.application.routes.draw do
  get 'movies/new'
  root 'home_page#index'
<<<<<<< HEAD
  
  resources :movies, only: [:index, :new, :create,:edit ,:update, :destroy]
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users,
    controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'   
    } 
  
  devise_scope :user do
    get "user/:id", to: "users/registrations#detail"
    get "signup", to: "users/registrations#new"
    get "login", to: "users/sessions#new"
    get "logout", to: "users/sessions#destroy"
  end

>>>>>>> a36d7a1087999b1815b0bb341533f1b4e9e1066d
end
