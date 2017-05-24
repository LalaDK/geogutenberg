class Mongo::Book
  include Mongoid::Document
  field :title, type: String
  field :author, type: String
  field :translator, type: String
  field :release_date, type: Date
  field :file_path, type: String
  field :author, type: String
  embeds_many :occurrences, :class_name => "Mongo::Occurrence"
  
  index({:title => 1}, {name: "title_1" })
  index({:author => 1}, {name: "author_1" })
  index({:file_path => 1}, {name: "file_path_1" })
  index({:"occurrences.city_id" => 1}, {name: "occurrences.city_id_1" })
end