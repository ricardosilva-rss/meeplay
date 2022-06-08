Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meetings do
    resources :user_meetings, only: [:create]
  end
  resources :boardgames, only: [:index, :show]
  resources :user_meetings, only: [:destroy]
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: :create
  end
  resources :profiles, only: [:show, :new, :create, :edit, :update]
  get 'my_meetings', to: "meetings#my_meetings"
  get 'calendar', to: 'meetings#calendar'
  resources :user_boardgames, only: [:new, :create, :index]
end
