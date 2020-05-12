Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"
  get "/auth/google_oauth2/callback", to: 'sessions#omniauth'

    resources :salesrepresentatives, only: [:new, :create, :show] do 
      resources :leads, only: [:new, :index]
      resources :tasks, only: [:new]
    end

  resources :organizations 

  resources :leads, only: [:show, :create, :edit, :update, :destroy]
  resources :tasks

  resources :sessions, only: [:new, :create, :destroy]
  

end
