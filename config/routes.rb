Rails.application.routes.draw do

  root 'home_page#index'
  get 'admin_page/index'
  get 'member_page/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ### deviseのコントローラをusersコントローラーにする。
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

  resources :infos

  resources :users, only: [:index, :show, :destroy]

  resources :movies do
    collection do
      get :members_view
      get :general_view
    end
  end

  resources :articles

  resources :galleries
end
