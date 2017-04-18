class Postgresql::AuthorController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        if params.has_key?(:search)
          query = Author.where("name LIKE ?",  '%' + params[:search].to_s + '%').limit(100)
        else
          query = Author.all.limit(100)
        end
        render json: query.to_a
      end
    end
  end
  
  def show
    respond_to do |format|
      format.json do
        author = Author.find(params[:id])
        render json: author.as_json(:include => {:books => {:include => {:occurrences => {:include => [:city]}}}})
      end
    end
  end
end
