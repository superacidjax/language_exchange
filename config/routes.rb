LanguageExchange::Application.routes.draw do

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions

  resources :pages


  match '/ui(/:action)', controller: 'ui'

  root to: 'pages#home'

end
