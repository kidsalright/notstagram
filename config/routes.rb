Rails.application.routes.draw do

  root 'posts#index'
  devise_for :users

  resources :posts do
    resources :comments
    resources :likes
  end

  resources :users
  resources :posts, only: [:index, :show, :create]

  get '/:username', to: 'users#index', as: :profile

end
