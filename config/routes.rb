Rails.application.routes.draw do
  get 'prestations/index'
  devise_for :users
  root to: 'tasks#index'

  resources :prestations, except: :destroy

  resources :tasks, only: :index
end
