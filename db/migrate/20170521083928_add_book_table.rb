class AddBookTable < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :translator
      t.date :release_date
      t.string :file_path
      t.index :file_path
      t.index :title
    end
  end
end