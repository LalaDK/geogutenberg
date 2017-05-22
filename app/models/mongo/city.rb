class Mongo::City
  include Mongoid::Document
  store_in :collection => :cities
  field :geonameid, type: String
  field :name, type: String
  field :population, type: Integer
  field :country_code, type: String
  field :loc, type: Array
  
  index({loc: "2d"}, {background: true})
end