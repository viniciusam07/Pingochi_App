Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pingochis, only: [:new, :create, :show] do
    patch 'slap', to: 'pingochis#slap'
    patch 'uti', to: 'pingochis#uti'
    patch 'feed', to: 'pingoshis#feed'
    patch 'sleep', to: 'pingoshis#sleep'
  end
end
