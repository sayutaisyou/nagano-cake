Rails.application.routes.draw do

  namespace :admins do
    get 'homes/top'
    resources :order_details, only:[:update]
    resources :orders, only:[:index, :show, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :customers do
    get 'homes/top'
    get 'homes/about'
    get 'orders/confirm'
    get 'orders/complete'
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :items, only:[:index, :show]
    get 'customers/my_page/:id' => 'customers#show', as: 'my_page'
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :customers, only:[:edit, :update]
    delete 'cart_items/destroy_all'
    resources :cart_items, only:[:index, :update, :destroy, :create]
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
