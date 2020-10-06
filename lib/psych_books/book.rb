class PsychBooks::Book
  attr_accessor :title, :author, :url, :author, :description, :rating, :page_count
  @@all =[]
  
  def initialize(title=nil, url=nil)
    @title = title
    @url = url
    save
  end
  
  def self.all
    PsychBooks::Scraper.scrape_books if @@all.empty?
    @@all
  end
  
  def self.get_details
    PsychBooks::Scraper.scrape_book_details(book)
  end
  
  def save
    @@all << self
  end
end