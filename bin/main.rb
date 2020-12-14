require_relative '../lib/scrapper'

def results
  array = []
  scrapper = Scrapper.new('https://weworkremotely.com/#job-listings')
  job_list = scrapper.scraper
  puts job_list
  job_list.each do |job|
    jobs = {
      name: job.css('span.company').text,
      title: job.css('span.title').text,
      feature: job.css('span.featured').text,
      role: job.css('span.company').text,
      region: job.css('span.region company').text
    }
    array << jobs
  end
  puts array
end

results
