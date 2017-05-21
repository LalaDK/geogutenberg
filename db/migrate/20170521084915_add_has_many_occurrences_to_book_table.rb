class AddHasManyOccurrencesToBookTable < ActiveRecord::Migration
  def change
    add_column :occurrences, :book_id, :integer
    add_index :occurrences, ['book_id'], :name => 'index_occurrences_id' 
  end
end
