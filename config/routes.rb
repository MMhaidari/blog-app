Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'users#index'
  resources :users, only: [:show] do
    resources :posts, only: %i[index show], param: :author_id
  end
  resources :posts, only: %i[index show], param: :post_id
end