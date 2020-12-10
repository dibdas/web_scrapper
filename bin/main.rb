require 'httparty'
require 'nokogiri'
require 'pry'


class Scrapper 
   
    attr_reader = @url
    #attr_reader = unparsed
    def initialize
        @url = 'https://weworkremotely.com/#job-listings'
    end

    def scrapper
    unparsed = HTTParty.get(@url) 
    parsed ||= Nokogiri::HTML(unparsed.body)
    puts parsed
    end
end
pry
s = Scrapper.new
s.scrapper

