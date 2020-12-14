require 'httparty'
require 'nokogiri'

class Scrapper
  attr_reader :url
  def initialize(url)
    @url = url
  end

  def scraper
    unparsed_page = HTTParty.get(@url)
    parsed_page ||= Nokogiri::HTML(unparsed_page.body)
    parsed_page.css('li.feature')
  end
end
