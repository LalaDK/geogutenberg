class Postgresql::OccurrenceController < ApplicationController
   def index
     respond_to do |format|
       format.json do
         query_params = {}
         query_params[:book_id] = params[:book_id] if params.has_key?(:book_id)
         query_params[:city_id] = params[:city_id] if params.has_key?(:city_id)
         query = Occurrence.includes([:book, :city]).where(query_params)
         render json: query.to_a.as_json(:include => [{:book => {:include => [:author]}}, :city])
       end
     end
   end
end
