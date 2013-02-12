LanguageExchange::Application.routes.draw do

  resources :pages
  resources :users


  match '/ui(/:action)', controller: 'ui'

  root to: 'pages#home'

end
