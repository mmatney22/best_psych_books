class PsychBooks::Book
  attr_accessor :title, :author, :url
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
  
  # def address
  #   PsychBooks::Scraper.get_address(self) if @address.empty?
  #   @address
  # end
  
  # def phone
  #   PsychBooks::Scraper.scrape_info(self) if @phone.empty?
  #   @phone
  # end
  
  # def url
  #   PsychBooks::Scraper.scrape_info(self) if @url.empty?
  #   @url
  # end
  
  def save
    @@all << self
  end
end