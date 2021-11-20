Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pingochis, only: [:new, :edit, :create, :show] do
    patch 'slap', to: 'pingochis#slap'
    patch 'uti', to: 'pingochis#uti'
    patch 'feed', to: 'pingochis#feed'
    patch 'sleep', to: 'pingochis#sleep'
    patch 'fish', to: 'pingochis#fish'
  end
  resources :items, only: [:index, :show]
end
