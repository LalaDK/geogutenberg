class RenameIndexOnOccurrences < ActiveRecord::Migration
  def change
    rename_index :occurrences, 'index_occurrences_id', 'index_city_id'
  end
end
