require_relative "./psych_books/version"
require_relative "./psych_books/cli"
require_relative "./psych_books/book"
require_relative "./psych_books/scraper"

require 'pry'
require 'nokogiri'
require 'open-uri'

module PsychBooks
  class Error < StandardError; end
  # Your code goes here...
end
