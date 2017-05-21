class AddHasManyBooksToAuthor < ActiveRecord::Migration
  def change
    puts "Ldsalædksadaslædkasdlæaskdaslæ"
    add_column :books, :author_id, :integer
    add_index :books, ['author_id'], :name => 'author_id' 
  end
end
