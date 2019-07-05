Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :update, :create, :show, :destroy]
      resources :stores, only: [:index, :create, :show]
      resources :users, only: [:index, :create, :show]
      resources :vendors, only: [:index, :create, :show]
      resources :orders, only: [:index, :update, :create, :show, :destroy]
      resources :items, only: [:index, :create]
      resources :transactions, only: [:index, :create]
      post '/userlogin', to: 'auth#userlogin'
      get '/userlogin', to: 'auth#auto_userlogin'
      post '/vendorlogin', to: 'auth#vendorlogin'
      get '/vendorlogin', to: 'auth#auto_vendorlogin'
      post '/storeorders', to: 'vendors#orderedProducts'
      post '/charge', to: 'stripe#charge'
    end
  end
end
