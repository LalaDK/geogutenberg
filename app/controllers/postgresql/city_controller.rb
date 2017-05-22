class Postgresql::CityController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        query = Postgresql::City.where("name LIKE ?", "%#{params[:search].to_s}%").limit(30)
        render json: query.to_a
      end
    end
  end
end
