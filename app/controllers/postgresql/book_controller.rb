class Postgresql::BookController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        if params.has_key?(:search)
          query = Book.where("title LIKE ?",  '%' + params[:search].to_s + '%').limit(100)
        else
          query = Book.all.limit(100)
        end
        render json: query.to_a
      end
    end
  end
  
  def show
    respond_to do |format|
      format.json do
        book = Book.find(params[:id])
        render json: book.as_json(:include => {:occurrences => {:include => [:city]}})
      end
    end
  end
  
  def by_location
    respond_to do |format|
      format.json do
        city_ids = City.within(params[:radius], :origin => [params[:latitude].to_f, params[:longitude].to_f]).pluck(:id)
        data = Occurrence.includes(:city, :book).where(:city_id => city_ids)
        render json: data.as_json(:include => {:city => {:only => [:name]}, :book => {:only => [:title]}})
      end
    end
  end
end
