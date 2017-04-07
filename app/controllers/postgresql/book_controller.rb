class Postgresql::BookController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render json: Book.all.to_a
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
end
