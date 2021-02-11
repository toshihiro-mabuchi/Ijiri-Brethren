Rails.application.routes.draw do

  ### ホームページ ###
  root 'home_page#index'

  ### 管理者画面 ###
  # get 'admin_page/index'
  resources :admin_pages, only: [:index] do
    collection do
      get :home
      # get :movie
    end
    # namespace :admin_pages do
      # resources :users, only: :index
    # end
  end
  namespace :admin_pages do
    resources :users, only: [:index]
    resources :movies, only: [:index]
    resources :articles, only: [:index]
    resources :infos, only: [:index]
    resources :galleries, only: [:index]
  end

  ### 会員様専用画面 ###
  # get 'member_page/index'
  resources :member_pages, only: [:index] do
    collection do
      get :articles
    end
  end

  ### ログイン・ユーザー関連 ###
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    }

  devise_scope :user do
      get 'users/:id/edit' => 'users/registrations#edit', as: :edit_other_user_registration
      match 'users/:id', to: 'users/registrations#update', via: [:patch, :put], as: :other_user_registration
  end

  resources :users, only: [:index, :show, :destroy]

  ### お知らせ ###
  resources :infos

  ### 動画 ###
  resources :movies do
    collection do
      get :members_view
      get :general_view
    end
  end

  ### お便り ###
  resources :articles

  ### 御言葉 ###
  resources :bibles
  
  ### ギャラリー ###
  resources :galleries
end
