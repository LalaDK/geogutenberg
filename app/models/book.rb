class Book < ActiveRecord::Base
  field :title, as: :text, index: true
  field :translator, as: :text
  field :release_date, as: :date
  field:file_path, as: :text
  belongs_to :author
  has_many :occurrences
end
Book.auto_upgrade!