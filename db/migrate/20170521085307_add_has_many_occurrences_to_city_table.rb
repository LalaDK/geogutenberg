class AddHasManyOccurrencesToCityTable < ActiveRecord::Migration
  def change
    add_column :occurrences, :city_id, :integer
    add_index :occurrences, ['city_id'], :name => 'city_id' 
  end
end
