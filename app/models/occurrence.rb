class Occurrence < ActiveRecord::Base
  belongs_to :book
  belongs_to :city
  field :count, as: :integer, default: 0
  add_index [:book_id, :city_id]
end
Occurrence.auto_upgrade!