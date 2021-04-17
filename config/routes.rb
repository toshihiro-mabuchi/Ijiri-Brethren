Rails.application.routes.draw do
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  ### ホームページ ###
  root 'home_page#index'
  get  'home_page/infos'  => 'home_page#infos'
  get  'home_page/infos/:id'  => 'home_page#infos_show'

  ### 管理者画面 ###
  resources :admin_pages, only: :index do
    collection do
      get :home
    end
  end
  namespace :admin_pages do
    resources :users
    resources :movies
    resources :articles
    resources :infos
    resources :galleries
    resources :general_movies
    resources :general_infos
    resources :bibles
  end

  ### メンバー専用画面 ###
  resources :member_pages, only: :index do
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

  resources :users, only: %i(index show destroy)

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
  
  ### アルバム ###
  resources :galleries, except: :show
end
