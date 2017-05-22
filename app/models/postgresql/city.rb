class Postgresql::City < ActiveRecord::Base
  #attr_accessor :geonameid
  #attr_accessor :name
  #attr_accessor :latitude
  #attr_accessor :longitude
  #attr_accessor :population
  #attr_accessor :country_code
  has_many :occurrences
  
  acts_as_mappable :default_units => :kms,
    :default_formula => :sphere,
    :distance_field_name => :distance,
    :lat_column_name => :latitude,
    :lng_column_name => :longitude
end