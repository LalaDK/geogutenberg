class Postgresql::Author < ActiveRecord::Base
  #attr_accessor :name
  has_many :books
end