Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'

  resources :prestations, except: :destroy

  resources :tasks, only: :index
end
