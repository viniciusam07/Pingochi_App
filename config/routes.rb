Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pingochis, only: [:new, :edit, :create, :show, :index] do
    patch 'slap', to: 'pingochis#slap'
    patch 'uti', to: 'pingochis#uti'
    patch 'feed', to: 'pingochis#feed'
    patch 'sleep', to: 'pingochis#sleep'
    patch 'fish', to: 'pingochis#fish'
    patch 'strength', to: 'pingochis#strength'
    patch 'inteligence', to: 'pingochis#inteligence'
    patch 'speed', to: 'pingochis#speed'
    get 'opponents', to: 'pingochis#opponents'
    get 'couples', to: 'pingochis#couples'
    resources :items, only: [:index]
    resources :inventories, only: [:create]

    resources :opponents, only: [] do
      resources :battles, only: [:new, :create, :show]
    end

    resources :couples, only: [] do
      resources :matings, only: [:new, :create, :show]
    end
  end
end
