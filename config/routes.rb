Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  get '/upload', to: 'posts#new'
  resources :posts, only: [:index, :show, :create]

  get '/:username', to: 'users#index', as: :profile

end
