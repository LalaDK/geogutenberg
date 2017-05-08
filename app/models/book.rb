class Book < ActiveRecord::Base
  field :title, as: :text, index: true
  field :translator, as: :text
  field :release_date, as: :date
  field:file_path, as: :text
end
Book.auto_upgrade!