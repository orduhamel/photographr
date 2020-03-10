Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :prestations, except: :destroy

  resources :tasks, only: :index
end
