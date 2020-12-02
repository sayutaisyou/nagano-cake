Rails.application.routes.draw do

  namespace :customers do
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end
  namespace :customers do
    get 'orders/confirm'
    get 'orders/complete'
    resources :orders, only:[:new, :create, :index, :show]
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
