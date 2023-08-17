Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
 root to: 'users/homes#top'
# ユーザー用
  namespace :users do
    root to: 'homes#top'
  end
  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_"
  end
  
  # 管理者用

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    passwords:     'users/passwords'
  }
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions:      'admins/sessions',
    passwords:     'admins/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
