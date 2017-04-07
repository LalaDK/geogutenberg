class Author < ActiveRecord::Base
  field :name, as: :text, index: true
  has_many :books
end
Author.auto_upgrade!