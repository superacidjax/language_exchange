LanguageExchange::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "sign_out"
  get "sign_in" => "sessions#new", :as => "sign_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions
  resources :pages
  resources :relationships, only: [:create, :destroy]

  match '/ui(/:action)', controller: 'ui'

  root to: 'users#index'

end
