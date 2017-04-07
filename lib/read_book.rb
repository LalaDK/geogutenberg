#!/usr/bin/env ruby
file_path = ARGV[0]
raise Exception, "File not found." if !File.exist?(file_path.to_s)
current_book = nil
current_author = nil
line_count = %x{wc -l #{file_path}}.split[0].to_i
current_line_no = 1
book_exists = false
count_reset_to_default = false

File.open(file_path, "r") do |f|
  f.each_line do |line|
    current_line_no = current_line_no + 1
    puts "Reading line: #{current_line_no} / #{line_count}" if current_line_no % 250 == 0

    ### Check for metadata
    # Check for title
    if line[0..6] == "Title: "
      title = line[6..-1].strip
      puts "Found title: #{title}"
      current_book = Book.where(:title => title).first || Book.new({title: title}) if current_book.nil?
      book_exists = !!current_book.id
      puts book_exists ? "Book exists in database." : "Creating book ..."
      current_book.save
    # Check for author
    elsif line[0..7] == "Author: " && current_book.author.nil?
      author_name = line[8..-1].strip
      puts "Found author: #{author_name}"
      current_author = Author.where(:name => author_name).first || Author.new({name: author_name})
      current_author.save
      if !current_book.nil? && current_book.author.nil?
        current_book.author = current_author
      end
    # Check for translator
    elseif line[0..11] == "Translator: " && current_book.translator.nil?
      translator = line[12..-1].strip
      puts "Found translator: #{translator}"
      current_book.translator = translator
    # Check for release date
    elseif line[0..13] == "Release Date: " && current_book.release_date.nil?
      # Parse string to date
      date = line[14..-1].match(/(\w+\s\d,\s\d+)/)[1].strip
      puts "Found release date: #{date}"
      current_book.release_date = Date.parse(date)
    end
    
    if book_exists && !count_reset_to_default 
      puts "Resetting all occurrences counts to 0 ..."
      Occurrence.where(:book_id => current_book.id).to_a.each do |occurrence|
        occurrence.count = 0
        occurrence.save
      end
      count_reset_to_default = true
    end
    
    ### Check for cities
    words = line.split
    words.each do |word|
      if !current_book.nil?
        city = City.where(:name => word).first
        if !city.nil?
          occurrence = Occurrence.where(:city_id => city.id, :book_id => current_book.id).first || Occurrence.new({city: city, book: current_book})
          occurrence.count = occurrence.count + 1
          occurrence.save
        end
      end
    end
  end
end

if !current_book.nil?
  hits = Occurrence.where(:book_id => current_book.id).count
  puts "Found #{hits} cities in #{current_book.title}."
end