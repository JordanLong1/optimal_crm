Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"

    resources :salesrepresentatives, only: [:new, :create, :show] do 
      resources :leads, only: [:new, :index]
      resources :tasks, only: [:new]
    end

  resources :organizations do 
    resources :leads, only: [:edit, :destroy]
  end

  resources :leads, only: [:show, :create]
  resources :tasks

  resources :sessions, only: [:new, :create, :destroy]
  

end
