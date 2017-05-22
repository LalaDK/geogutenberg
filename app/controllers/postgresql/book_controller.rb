class Postgresql::BookController < ApplicationController
  
  def index
    respond_to do |format|
      format.json do
        if params.has_key?(:search)
          query = Postgresql::Book.where("title LIKE ?",  '%' + params[:search].to_s + '%').limit(30)
        else
          query = Postgresql::Book.all.limit(30)
        end
        render json: query.to_a
      end
    end
  end
  
  def show
    respond_to do |format|
      format.json do
        book = Postgresql::Book.find(params[:id])
        render json: book.as_json(:include => {:occurrences => {:include => [:city]}})
      end
    end
  end
  
  def books_by_city
    respond_to do |format|
      format.json do
        query_params = {:city_id => params[:city_id].to_i}
        book_ids = Postgresql::Occurrence.where(query_params).pluck(:book_id)
        query = Postgresql::Book.where(:id => book_ids)
        render json: query.to_a.as_json(:include => [:author])
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
