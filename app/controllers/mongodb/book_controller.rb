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
        query = Mongo::Book.where(:"occurrences.city_id" => params[:city_id])
        render json: query.to_a.as_json
      end
    end
  end
  
  def by_location
    respond_to do |format|
      format.json do
        city_ids = Postgresql::City.within((params[:radius].to_i > 200 ? 200 : params[:radius]), :origin => [params[:latitude].to_f, params[:longitude].to_f]).pluck(:id)
        data = Postgresql::Occurrence.where(:city_id => city_ids).includes(:city, :book)
        render json: data.as_json(:include => {:city => {:only => [:name]}, :book => {:only => [:title]}})
      end
    end
  end
end