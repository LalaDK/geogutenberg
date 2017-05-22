class Mongodb::CityController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        query = Mongo::City.where(:name => /#{params[:search].to_s}/i).limit(30)
        render json: query.to_a
      end
    end
  end
end