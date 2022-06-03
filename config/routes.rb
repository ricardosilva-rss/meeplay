Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meetings do
    resources :user_meetings, only: [:create]
  end
  resources :boardgames, only: [:index, :show]
  resources :user_meetings, only: [:destroy]
  resources :chatrooms, only: [:show] do
    resources :messages, only: :create
  end
  get 'my_meetings', to: "meetings#my_meetings"
end
