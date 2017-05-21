class RenameIndexOnOccurrencesOnceAgain < ActiveRecord::Migration
  def change
    rename_index :occurrences, 'index_city_id', 'book_id'
  end
end
