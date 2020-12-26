Rails.application.routes.draw do
  get 'users/index'
  get 'user/index'
  root 'home_page#index'
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
  # devise_scope :user do
  #   get 'user/:id', to: 'users/registrations#detail'
  #   get 'signup',   to: 'users/registrations#new'
  #   get 'login',    to: 'users/sessions#new'
  #   get 'logout',   to: 'users/sessions#destroy'
  #   get 'edit',     to: 'users/registrations#edit'
  # end

  ### deviseで用意されていない処理をusersコントローラーで定義する。
  resources :users

  get 'member/home', to: 'users#member_home'
  get 'admin/home',  to: 'users#admin_home'

end
