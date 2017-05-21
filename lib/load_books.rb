#!/usr/bin/env ruby
puts ARGV.inspect
if !File.exists?("lib/files_index.txt")
  directory = ARGV[0] || Rails.root.join('data', 'books')  
  arr = Dir[directory + "**/*.txt"]
  File.open("lib/files_index.txt", "w+") do |f|
    arr.each { |element| f.puts(element) }
  end
end
puts "Loading cities ..."
cities = City.all.to_a.reduce({}){|result, city| result[city.name.to_sym] = city.id;result}
puts "Done loading cities ..."

line_status_file = Rails.root.join('lib', 'books_current_line')
file_paths = File.readlines("lib/files_index.txt").map &:strip
book_count = file_paths.length
current_book_no = File.exist?(line_status_file) ? (File.open(line_status_file) {|f| f.readline}).to_i :  0
avg_runtimes = []

puts "Found #{file_paths.length} books."

file_paths.each_with_index do |file_path, index|
  
  next if index < current_book_no
  File.write(line_status_file, index.to_s)
  
  
  puts "Reading (#{current_book_no + 1} / #{book_count}) #{file_path} ..."
  raise "File not found." unless File.exists?(file_path)
  time_start = Time.now
  
  current_book = Book.where(:file_path => file_path).first
  book_exists = !current_book.nil?
  current_book = Book.new({:file_path => file_path}) if current_book.nil?
  current_book.save
  
  current_author = nil
  #line_count = %x{wc -l #{file_path}}.split[0].to_i
  current_line_no = 1
  count_reset_to_default = false

  File.open(file_path, "r:UTF-8") do |f|
    f.each_line do |line|
      line = line.scrub
      current_line_no = current_line_no + 1
      #puts "Reading line: #{current_line_no} / #{line_count}" if current_line_no % 1000 == 0
      ### Check for metadata
      # Check for title
      if !line.blank?
        if current_book.title.blank? && line.length > 6 && line[0..6] == "Title: "
          title = line[6..-1].strip
          #puts "Found title: #{title}"
          current_book.title = title

          # Check for author
        elsif current_book.author.blank? && line.length > 8 && line[0..7] == "Author: "
          author_name = line[8..-1].strip
          #puts "Found author: #{author_name}"
          current_author = Author.where(:name => author_name).first || Author.new({name: author_name})
          current_author.save
          current_book.author = current_author
          
          # Check for translator
        elsif current_book.translator.blank? && line.length > 12 &&  line[0..11] == "Translator: "
          translator = line[12..-1].strip
          #puts "Found translator: #{translator}"
          current_book.translator = translator
          
          # Check for release date
        elsif current_book.release_date.blank? && line.length > 14 && line[0..13] == "Release Date: "
          # Parse string to date
          begin
            date_str = line[14..-1]
            date = (date_str.match(/(\w+\s\d+,\s\d+)/) || [])[0]
            date = (date_str.match(/(\w+,\s\d+)/) || [])[0] if date.nil?
            date = (date_str.match(/\w+\s\d+/) || [])[0] if date.nil?
            date = date.try(:strip)
            #puts "Unable to parse release date: #{line}" if date.blank?
            if !date.blank?
              #puts "Found release date: #{date}"
              current_book.release_date = Date.parse(date)
              
            end
          rescue Exception => e
            #puts "Failed to parse date ..."
          end
        end
        if book_exists && !count_reset_to_default 
          #puts "Resetting all occurrences counts to 0 ..."
          Occurrence.where(:book_id => current_book.id).to_a.each do |occurrence|
            occurrence.count = 0
            occurrence.save
          end
          count_reset_to_default = true
        end
    
        ### Check for cities
        city_names = line.scan(/(([A-ZÅØÆ][\wøæå\-\é\´\`\'éíìúùüîïáàäóòö]+)(\s([A-ZÅØÆ][\wøæå\-\é\´\`\'éíìúùüîïáàäóòö]+))*)/).map &:first
        city_names.each do |city_name|
          if cities.has_key?(city_name.to_sym)
            count = city_names.count{|word| word == city_name}
            occurrence = Occurrence.where(:city_id => cities[city_name.to_sym], :book_id => current_book.id).first || Occurrence.new({city_id: cities[city_name.to_sym], book: current_book})
            occurrence.count = occurrence.count + count
            occurrence.save
          end
        end
      end
    end
  current_book.save
  end

  
  #hits = Occurrence.where(:book_id => current_book.id).count
  #puts "Found #{hits} cities in #{current_book.title}."
  
  elapsed_time = Time.now - time_start
  elapsed_time_in_seconds = ((elapsed_time % 3600) % 60).to_i
  avg_runtimes << elapsed_time_in_seconds
  avg_time = avg_runtimes.inject{ |sum, el| sum + el }.to_f / avg_runtimes.size
  
  #puts "Elapsed time (seconds): #{elapsed_time_in_seconds}"
  puts "Average reading time (seconds): #{avg_time}"
  current_book_no = current_book_no + 1
end
puts "Total elapsed time (seconds): #{avg_runtimes.inject{ |sum, el| sum + el }.to_f}\n"