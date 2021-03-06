class Mongo::Occurrence
  include Mongoid::Document
  field :count, type: Integer
  belongs_to :city, :class_name => "Mongo::City"
  embedded_in :book, :class_name => "Mongo::Book"
end