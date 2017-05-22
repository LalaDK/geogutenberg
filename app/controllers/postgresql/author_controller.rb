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
        author = Postgresql::Author.find(params[:id])
        render json: author.as_json(:include => {:books => {:include => {:occurrences => {:include => [:city]}}}})
      end
    end
  end
end
