class Postgresql::CityController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        query = nil
        if params.has_key?(:search)
          query = City.where("name LIKE ?",  '%' + params[:search].to_s + '%').limit(100)
        else
          query = City.all.limit(100)
        end
        render json: query.to_a
      end
    end
  end
end
