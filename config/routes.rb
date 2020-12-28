Rails.application.routes.draw do

  root 'home_page#index'
  get 'admin_page/index'
  get 'member_page/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ### deviseのデフォルトのroutes
  # devise_for :users

  ### deviseのコントローラをusersコントローラーにする。
  devise_for :users,
  #  :path_prefix => 'd',
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      # confirmations: 'users/confirmations',
      passwords: 'users/passwords'
  }

  ### deviseのviewファイルをuserフォルダ配下にする。
  devise_scope :user do
  #   get 'user/:id', to: 'users/registrations#detail'
  #   get 'signup',   to: 'users/registrations#new'
  #   get 'login',    to: 'users/sessions#new'
  #   get 'logout',   to: 'users/sessions#destroy'
  #   get 'edit',     to: 'users/registrations#edit'
      get 'users/:id/edit' => 'users/registrations#edit', as: :edit_other_user_registration
      match 'users/:id', to: 'users/registrations#update', via: [:patch, :put], as: :other_user_registration
  end

  resources :users, only: [:index, :destroy]

  resources :articles
end
