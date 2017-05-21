class City < ActiveRecord::Base
  field :geonameid, as: :text, index: true
  field :name, as: :text, index: true
  field :latitude, as: :float
  field :longitude, as: :float
  field :population, as: :integer
  field :country_code, as: :text, index: true
  
  acts_as_mappable :default_units => :kms,
    :default_formula => :sphere,
    :distance_field_name => :distance,
    :lat_column_name => :latitude,
    :lng_column_name => :longitude
end
City.auto_upgrade!