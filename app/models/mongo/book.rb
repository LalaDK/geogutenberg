class Mongo::Book
  include Mongoid::Document
  field :title, type: String
  field :translator, type: String
  field :release_date, type: Date
  field :file_path, type: String
  field :author, type: String
  embeds_many :occurrences, :class_name => "Mongo::Occurrence"
end