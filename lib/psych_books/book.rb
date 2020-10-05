class PsychBooks::Book
  attr_accessor :title, :author, :url, :author, :description
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
    PsychBooks::Scraper.scrape_book_details
  end
  
  def save
    @@all << self
  end
end