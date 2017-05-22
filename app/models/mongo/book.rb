class Mongo::Book
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :translator, type: String
  field :release_date, type: Date
  field :file_path, type: String
  field :author, type: String
  embeds_many :occurrences, :class_name => "Mongo::Occurrence"
  
  index({:title_id => 1}, {name: "title_id_1" })
  index({:author_id => 1}, {name: "author_id_1" })
  index({:file_path_id => 1}, {name: "file_path_id_1" })
end