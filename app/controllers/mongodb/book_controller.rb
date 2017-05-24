class Mongodb::BookController < ApplicationController
    def index
    respond_to do |format|
      format.json do
        if params.has_key?(:search)
          query = Mongo::Book.where(:title => /#{params[:search].to_s}/i).limit(50)
        else
          query = Mongo::Book.all.limit(50)
        end
        render json: query.to_a
      end
    end
  end
  
  def show
    respond_to do |format|
      format.json do
        book = Mongo::Book.find(params[:id])
        render json: book.as_json(:include => {:occurrences => {:include => [:city]}})
      end
    end
  end
  
  def by_author
    respond_to do |format|
      format.json do
        query = Mongo::Book.where(:"author" => params[:id])
        render json: query.to_a.as_json(:include => {:occurrences => {:include => [:city]}})
      end
    end
  end
  
  def books_by_city
    respond_to do |format|
      format.json do
        query = Mongo::Book.where("occurrences.city_id" => params[:id].to_i)
        binding.pry
        render json: query.to_a.as_json(:except => [:occurrences, :file_path])
      end
    end
  end
  
  def by_location
    respond_to do |format|
      format.json do
        radius = (params[:radius].to_i > 200 ? 200 : params[:radius].to_i) / 111.12
        city_ids = Mongo::City.where(:loc => {:"$near" => [params[:longitude].to_f, params[:latitude].to_f], :"$maxDistance" => radius}).to_a.map &:id
        data = Mongo::Book.where(:"occurrences.city_id".in => city_ids)
        render json: data.as_json
      end
    end
  end
end