Rails.application.routes.draw do

  root 'customers/homes#top'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'homes/top'
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :customers do
    get 'homes/about'
    post 'orders/confirm'
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


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
