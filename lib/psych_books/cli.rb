class PsychBooks::CLI

  def call 
    puts "\nWelcome to Goodreads Best Psychology Books!\n".green
    get_books
    list_books
    get_user_book
  end
  
  def get_books
    @books = PsychBooks::Book.all             #sets variable to all array, containing book objects
  end
  
  def list_books
    puts "\nChoose a book to see more information:\n".green
    @books.each.with_index(1) {|book, index| puts "#{index}. #{book.title}".cyan}     #iterates and lists books
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
    PsychBooks::Scraper.scrape_book_details(book)   #set variable to array item of @books, minus 1 for correct index
    puts "\nHere are the details for #{book.title}:\n".green
    puts "\nAuthor:".yellow.bold + " #{book.author}\n".cyan
    puts "\nDescription:".yellow.bold + " #{book.description}\n".cyan
    puts "\nPage count:".yellow.bold + " #{book.page_count}\n".cyan
    puts "\nRating:".yellow.bold + " #{book.rating}\n".cyan
    menu
  end
  
  def menu
    puts "Type 'books' to see the list of books again.".green
    puts "Type 'exit' to exit.".green
    puts ""
    input = gets.strip.downcase
    menu_decision(input)
  end
  
  def menu_decision(input)
    if input == "books"
      list_books
      get_user_book
    elsif input == "exit"
      puts "\nThank you for choosing Goodreads! Happy reading!\n".green
    else
      puts "\nI'm not quite sure I understand. Please try again.\n".green
      menu
    end
  end
end