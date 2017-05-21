class AddOccurrenceTable < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.integer :count, default: 0
      t.index :count
    end
  end
end
