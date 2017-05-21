class AddAuthorTable < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.index :name
    end
  end
end
