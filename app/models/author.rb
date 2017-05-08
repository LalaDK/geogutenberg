class Author < ActiveRecord::Base
  field :name, as: :text, index: true
end