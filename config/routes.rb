Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static#home"

    resources :salesrepresentative, only: [:new, :create]

  resources :organizations do 
    resources :leads, only: [:new, :create, :show, :edit, :destroy]
  end

  resources :leads
  resources :tasks
  

end
