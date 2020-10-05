class PsychBooks::CLI

  def call 
    puts "\nWelcome to Goodreads Best Psychology Books!\n"
    get_books
    list_books
    get_user_book
  end
  
  def get_books
    @books = PsychBooks::Book.all             #sets variable to all array, containing book objects
  end
  
  def list_books
    puts "Choose a book to see more information:"
    @books.each.with_index(1) {|book, index| puts "#{index}. #{book.name}"}    #iterates over array, and lists books
  end
  
  def get_user_book
    chosen_book = gets.strip.to_i
    list_info_for(chosen_book) if valid_input?(chosen_book, @books)        #if valid input, show list of books
  end
  
  def valid_input?(input, data)
    input.to_i <= data.length && input.to_i > 0        #change input to integar and check validity
  end
  
  def list_info_for(chosen_book)
    book = @books[chosen_book - 1] 
    book.get_info                               #set variable to array item of @books, minus 1 for correct index
    puts "Here is info for #{book.name}:"
    book.info.each.with_index(1) do |info, index|       #go thru all books and lists info
      puts "#{index}. #{info.name}"
    end
  end
  
end