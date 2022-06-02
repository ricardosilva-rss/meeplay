Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meetings do
    resources :user_meetings, only: [:create]
  end
  resources :boardgames, only: [:index, :show]
  resources :user_meetings, only: [:destroy]
end
