Rails.application.routes.draw do
  root 'home_page#index'

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

  resources :movies do
    collection do
      get :members_view
      get :general_view
    end
  end

  resources :articles
end
