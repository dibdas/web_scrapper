require_relative '../lib/scrapper'
require 'colorize'

def results
  scrapper = Scrapper.new('https://weworkremotely.com/#job-listings')
  job_list = scrapper.scraper
  job_list.each do |job|
    jobs = {
      name: job.css('span.company').text,
      title: job.css('span.title').text
    }
    puts "company: #{jobs[:name]}".red.bold
    puts "role: #{jobs[:title]}".yellow.bold
    sleep(0.7)
  end
end

def input
  puts 'would you like to see the details of the website ?'
  puts "To continue \n Type 'y' or press 'Enter' \n \n"
  puts "To stop and quit \n Type 'q' \n \n"
  choice = gets.chomp.downcase
  if ['y', ' '].include?(choice)
    results
  elsif %w[q].include?(choice)
    puts 'good luck with you searching'.yellow
    puts 'thank you for using my scraper'.green.bold
    exit
  else
    puts 'invalid character'.red.bold
    puts "To continue \n Type 'y' or press 'Enter' \n \n"
    puts "To stop and quit \n Type 'q' \n \n"
    results
  end
end

input
