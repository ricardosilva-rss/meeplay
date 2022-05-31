Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :meetings
  resources :boardgames, only: [:index, :show]
end
