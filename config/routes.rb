Rails.application.routes.draw do
  resources :articles
  resources :actors

  resources :movies do
    resources :reviews do
      resources :comments
    end
  end

  resources :reviews do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  devise_for :users
  root 'movies#index'
  get 'about', to: 'pages#about'
  get 'history', to: 'comments#history'
  put 'favorite', to: 'movies#favorite'
  put 'helpful', to: 'reviews#helpful'
  put 'role', to: 'movies#role'
  put 'direct', to: 'movies#direct'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
