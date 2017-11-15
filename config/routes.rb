Rails.application.routes.draw do

    resources :users do
        member do
          get :following, :followers
        end
    end
    root 'main#index'

    get "login" => "sessions#new"

    post "login" => "sessions#create"

    delete "logout" => "sessions#destroy"

    resources :user
    resources :relationships
    resources :event

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
