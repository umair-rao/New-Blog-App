Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show index] do
    resources :posts, only: %i[show index]
  end

  # Uncomment and specify the controller and action for the root route
  root to: 'users#index'
end
