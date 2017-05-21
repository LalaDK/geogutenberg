class AddCityTable < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :geonameid
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :population
      t.string :country_code
      t.index :name
    end
  end
end