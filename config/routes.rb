Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      get '/products', to: 'products#all'
      resources :categories do
        resources :products
      end
      resources :users
      resources :products
      resources :orders do
        resources :purchased_products
      end
      namespace :analyst do
        resources :orders
        resources :categories
        resources :products
      end
    end
  end
end
