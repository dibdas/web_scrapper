require 'httparty'
require 'nokogiri'
require 'pry'

    def scraper
        array =[]
        url = 'https://weworkremotely.com/#job-listings'
        unparsed_page = HTTParty.get(url) 
        parsed_page ||= Nokogiri::HTML(unparsed_page.body)
        job_listing = parsed_page.css('li.feature')
       # @total = parsed_page.css('h2.rc-NumberOfResultsSection span').text.gsub(/[^\d]/, '').to_i
        total_jobs = parsed_page.css('p b#total').text.gsub(/[^\d]/, '').to_i
        page=1
        per_page = job_listing.count
        last_page = (total_jobs/per_page)
        #binding.pry
        puts total_jobs
        while page<=last_page
            puts "Page: #{page}"
            pagination_url ="https://weworkremotely.com/#job-listings/page=#{page}"
                job_listing.each do |job|
                    jobs={
                            name: job.css('span.company').text,
                            title: job.css('span.title').text,
                            feature: job.css('span.featured').text,
                            role: job.css('span.company').text,
                            region:job.css('span.region company').text,
                         }
                array<<jobs
            puts "Added: #{jobs[:region]}"
             end
            page+=1
        end
       # puts array
        #binding.pry
    end


scraper

