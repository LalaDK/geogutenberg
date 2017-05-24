class Postgresql::CityController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        query = Postgresql::City.where("name LIKE ?", "%#{params[:search].to_s}%").limit(30)
        render json: query.to_a
      end
    end
  end
  
  def by_book
    respond_to do |format|
      format.json do
        cities = Postgresql::Occurrence.connection.query("SELECT occurrences.count, cities.* FROM occurrences NATURAL JOIN cities WHERE book_id = #{params[:id]};")
        render json: cities.to_a
      end
    end
  end
end
