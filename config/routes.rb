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

  resources :tasks, only: [:index, :show, :edit, :update] do
    collection do
      get :calendar
    end

    member do
      get :index
      patch :mark_as_urgent
      patch :mark_as_done
    end
  end

  resources :clients, only: [:index, :show]
end
