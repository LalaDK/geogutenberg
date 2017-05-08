class Occurrence < ActiveRecord::Base
  field :count, as: :integer, default: 0
  index :book_id
  index :city_id
end