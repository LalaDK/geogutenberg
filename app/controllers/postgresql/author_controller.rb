class Postgresql::AuthorController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        if params.has_key?(:search)
          query = Postgresql::Author.where("name LIKE ?",  '%' + params[:search].to_s + '%').limit(20)
        else
          query = Postgresql::Author.all.limit(20)
        end
        render json: query.to_a
      end
    end
  end
  
  def show
    respond_to do |format|
      format.json do
        data = Postgresql::Author.connection.query("SELECT title, count, cities.name, latitude, longitude FROM books JOIN occurrences ON books.id = occurrences.book_id JOIN cities ON occurrences.city_id = cities.id WHERE author_id = #{params[:id]};").to_a
        
        
        render json: data.group_by{|a| a[0]}
      end
    end
  end
end
