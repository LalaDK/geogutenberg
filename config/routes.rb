Geogutenberg::Application.routes.draw do
  namespace :postgresql do
    resources :main, :only => ["index"]
    resources :author, :only => ["index", "show"]
    resources :book, :only => ["index", "show"]
    get "booksByCity", :controller => "book", :action => "books_by_city"
    get "booksByLocation", :controller => "book", :action => "by_location"
    resources :city, :only => ["index"]
    get "citiesByBook", :controller => "city", :action => "by_book"
  end
  
  root to: 'postgresql/main#index'
  
  
  namespace :mongodb do
    resources :main, :only => ["index"]
    resources :city, :only => ["index"]
    resources :book, :only => ["index", "show"]
    resources :author, :only => ["index"]
    get "booksByCity", :controller => "book", :action => "books_by_city"
    get "booksByLocation", :controller => "book", :action => "by_location"
    get "booksByAuthor", :controller => "book", :action => "by_author"
  end
  
  namespace :performance_test do
    resources :main, :only => ["index"]
  end
end
