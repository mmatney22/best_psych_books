class PsychBooks::Scraper
  @@all = []
  
  def self.all 
    @@all 
  end

  def self.scrape_books
    doc = Nokogiri::HTML(open("https://www.goodreads.com/list/show/1295.Greatest_Psychology_Books")) 
    
    books = doc.css("tr td")
    
    books.each do |book|               #make books
      title = book.css("a.bookTitle span").text
      url = book.css("a.bookTitle").attr("href")
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