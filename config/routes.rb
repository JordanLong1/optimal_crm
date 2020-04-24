Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"

    resources :salesrepresentatives, only: [:new, :create, :show]

  resources :organizations do 
    resources :leads, only: [:create, :show, :edit, :destroy]
  end

  resources :leads, only: [:new]
  resources :tasks
  

end
