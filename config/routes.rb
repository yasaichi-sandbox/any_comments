Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  devise_for :users

  resources :users, only: :show do
    resources :posts, only: %i(index show), module: :users
    # resources :works, only: %i(index show), module: users
  end

  resources :posts, only: [] do
    resources :comments, only: %i(create), module: :posts
    # resource :like, only: %i(create destroy), module: :posts
  end
end
