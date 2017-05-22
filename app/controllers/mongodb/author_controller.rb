class Mongodb::AuthorController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render json: Mongo::Book.where(:author => /#{params[:search]}/i).limit(30).as_json(:only => [:author])
      end
    end
  end
end