class RemoveBookAuthorTable < ActiveRecord::Migration
  def change
    drop_table :authors_books
  end
end
