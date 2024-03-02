Rails.application.routes.draw do
  get 'search', to: 'search#index'
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

  delete "/accounts/accountAndApplications/:id", to: "accounts#destroy_with_applications", as: :destroy_with_applications
  delete "/companies/companyAndJobs/:id", to: "companies#destroy_with_jobs", as: :destroy_with_jobs

end
