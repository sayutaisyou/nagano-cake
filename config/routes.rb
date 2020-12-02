Rails.application.routes.draw do



  namespace :customers do
    resources :items, only:[:index, :show]

    resources :customers, only:[:edit, :update]
    get 'customers/my_page/:id' => 'customers#show', as: 'my_page'
    get 'customers/unsubscribe'
    patch 'customers/withdraw'

    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all'

  end


  namespace :admins do
    get 'homes/top'
  end

  namespace :customers do
    get 'homes/top'
    get 'homes/about'
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
