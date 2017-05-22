class Postgresql::Book < ActiveRecord::Base
  #attr_accessor :title
  #attr_accessor :translator
  #attr_accessor :release_date
  #attr_accessor :file_path
  has_many :occurrences
  belongs_to :author
end