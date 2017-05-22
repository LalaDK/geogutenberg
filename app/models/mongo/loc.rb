class Mongo::Loc
  include Mongoid::Document
  field :lng, type: Float 
  field :lat, type: Float
  embedded_in :city, :class_name => "Mongo::City"
end