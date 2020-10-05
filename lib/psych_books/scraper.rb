class PsychBooks::Scraper
  @@all = []
  
  def self.all 
    @@all 
  end

  def self.scrape_books
    doc = Nokogiri::HTML(open("https://www.goodreads.com/shelf/show/must-read-psychology")) 
    
    books = doc.css("div.left")
    
    books.each do |book|               #make books
      title = book.css("a.bookTitle").text
      url = book.css("a").attr("href").value
      PsychBooks::Book.new(title, url)
    end
  end
  
  def self.scrape_book_details(book)
    basepath = "https://www.goodreads.com/"
    doc = Nokogiri::HTML(open("#{basepath + book.url}"))
    author= doc.css("   ").text
    description = doc.css(" ").text.strip
    rating = 
    book.author = author
    book.description = description
    book.rating = rating
  end
  
end