Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'users#index'
  resources :users do
    resources :posts do
      resources :comments
      resources :likes, only: %i[create destroy]
    end
  end
end
