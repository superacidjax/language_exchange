LanguageExchange::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "sign_out"
  get "sign_in" => "sessions#new", :as => "sign_in"
  get "sign_up" => "users#new", :as => "sign_up"

  resources :users

  resources :sessions

  resources :pages


  match '/ui(/:action)', controller: 'ui'

  root to: 'users#index'

end
