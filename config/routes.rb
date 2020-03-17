Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :prestations, except: :destroy do
    member do
      patch :finish
    end
  end

  # POST "prestations/51/finish"
  # post "prestations/finish", to: 'prestations#finish', as: :finish_prestation

  resources :tasks, only: [:index, :show, :edit] do
    collection do
      get :calendar
    end
  end

  resources :clients, except: :destroy
end
