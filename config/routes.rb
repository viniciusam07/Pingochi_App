Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pingochis, only: [:new, :create, :show] do
    patch 'slap', to: 'pingochis#slap'
    #acrescentar aqui as próximas ações
  end
end
