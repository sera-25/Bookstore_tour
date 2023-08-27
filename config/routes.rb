Rails.application.routes.draw do

  # 管理者用
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions:      'admins/sessions',
    passwords:     'admins/passwords'
  }

  # ユーザー用
  devise_scope :users do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    passwords:     'users/passwords'
  }
  namespace :admins do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
  end

  scope module: :users do
    root to: 'homes#top'
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
        resources :comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
