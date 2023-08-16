Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'user/registrations',
    sessions:      'user/sessions',
    passwords:     'user/passwords'
  }
  devise_for :admins, controllers: {
    registrations: 'admin/registrations',
    sessions:      'admin/sessions',
    passwords:     'admin/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
