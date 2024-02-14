Rails.application.routes.draw do
  devise_for :installs
  
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/sign_up' => 'devise/registrations#create'
  end

  get '/test', to: 'test#show'

  namespace :api do
    namespace :v1 do
      resources :companies do
        resources :jobs, only: [:create, :update, :destroy] 
      end
      resources :jobs, only: [:index, :show]
      resources :accounts do
        resources :applications 
      end
    end
  end

  get "about", to: "pages#about"

  root "pages#home"
end
