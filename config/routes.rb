Geogutenberg::Application.routes.draw do
  namespace :postgresql do
    resources :main, :only => ["index"]
    resources :book, :only => ["index", "show"]
  end
  
  root to: 'postgresql/main#index'
end
