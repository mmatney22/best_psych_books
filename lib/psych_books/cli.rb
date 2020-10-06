class PsychBooks::CLI

  def call 
    puts "\nWelcome to Goodreads Best Psychology Books!\n".blue
    get_books
    list_books
    get_user_book
  end
  
  def get_books
    @books = PsychBooks::Book.all             #sets variable to all array, containing book objects
  end
  
  def list_books
    puts "Choose a book to see more information:".blue
    @books.each.with_index(1) {|book, index| puts "#{index}. #{book.title}"}     #iterates and lists books
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
    puts "Here are the details for #{book.title}:".blue
    puts "Author:".light green "#{book.author}".light_green
    puts "Description: #{book.description}".light_green
    puts "Rating: #{book.rating}".light_green
    puts "Page count: #{book.page_count}".light_green
    puts ""
    menu
  end
  
  def menu
    puts "Type 'books' to see the list of books again.".blue
    puts "Type 'exit' to exit.".blue
    puts ""
    input = gets.strip.downcase
    menu_decision(input)
  end
  
  def menu_decision(input)
    if input == "books"
      list_books
      get_user_book
    elsif input == "exit"
      puts "Thank you for choosing Goodreads! Happy reading!".blue
    else
      puts "I'm not quite sure I understand. Please try again.".blue
      menu
    end
  end
end