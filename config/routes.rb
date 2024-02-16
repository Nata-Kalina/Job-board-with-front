Rails.application.routes.draw do
  devise_for :users
  

  get '/test', to: 'test#show'

  
  resources :companies do
    resources :jobs, only: [:create, :update, :destroy, :new, :edit]
  end
  resources :jobs, only: [:index, :show] do
    resources :accounts do
      resources :applications, only: [:new, :create]
    end
  end
  resources :accounts do
    resources :applications 
  end
    

  get "about", to: "pages#about"

  root "pages#home"
end
