class Occurrence < ActiveRecord::Base
  belongs_to :book
  belongs_to :city
  field :count, as: :integer, default: 0
  index :book_id
  index :city_id
end
Occurrence.auto_upgrade!