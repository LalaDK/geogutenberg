Geogutenberg::Application.routes.draw do
  namespace :postgresql do
    resources :main, :only => ["index"]
    resources :author, :only => ["index", "show"]
    resources :occurrence, :only => ["index", "show"]
    resources :book, :only => ["index", "show"]
    get "booksByLocation", :controller => "book", :action => "by_location"
    resources :city, :only => ["index", "show"]
  end
  
  root to: 'postgresql/main#index'
end
