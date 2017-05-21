class Occurrence < ActiveRecord::Base
  #attr_accessor :count
  belongs_to :book
  belongs_to :city
end