class City < ActiveRecord::Base
  field :geonameid, as: :text, index: true
  field :name, as: :text, index: true
  field :latitude, as: :decimal, scale: 6, precision: 9
  field :longitude, as: :decimal, scale: 6, precision: 9
  field :population, as: :integer
  field :country_code, as: :text, index: true
  has_many :occurrences
end
City.auto_upgrade!