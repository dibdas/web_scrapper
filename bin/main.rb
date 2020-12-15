require_relative '../lib/scrapper'
require 'colorize'




def jobs_choice
      puts "enter the job you to search for ?"
      puts "type '1' for remote-business-management-and-finance-jobs "
      puts "type '2' for remote-programming-jobs "
      puts "type '3' for remote-sales-and-marketing-jobs "
      puts "type '4' for remote-design-jobs "
      puts "type '5' for remote-customer-support-jobs"
      puts "type '6' for remote-product-jobs"
      puts "type '7' for all-other-remote-jobs"
      puts "type '8' for remote-devops-sysadmin-jobs"

      chose = gets.chomp
      case chose
      when '1'
          user_input = "remote-business-management-and-finance-jobs" 
      when '2'
          user_input = "remote-programming-jobs"
      when '3'
          user_input = "remote-sales-and-marketing-jobs"
      when '4'
          user_input = "remote-design-jobs"
      when '5'
          user_input = "remote-customer-support-jobs"
      when '6'
          user_input = "remote-product-jobs"
      when '7'
          user_input = "all-other-remote-jobs"
      when '8'
          user_input = "remote-devops-sysadmin-jobs"
      else
          puts "invalid input"
          exit
      end

      user_input

end

def input
  puts 'would you like to see the details of the website ?'
  puts "To continue \n Type 'y' and press 'Enter' \n \n"
  puts "To quit Type 'q' \n \n"
  loop do
  choice = gets.chomp.downcase
    if ['y', ''].include?(choice)
      puts "now choose "
      break
    elsif %w[q].include?(choice)
        puts 'good luck with you searching'.yellow
        puts 'thank you for using my scraper'.green.bold
        exit
    else
        puts 'invalid character'.red.bold
        puts "To continue \n Type 'y' "
        puts "To quit Type 'q' "
        choice
    end
  end 
  jobs_choice
end

input_category = input
puts "input_category: #{input_category} "



def results(input_category)
 scrapper = Scrapper.new("https://weworkremotely.com/categories/#{input_category}")
 job_list = scrapper.scraper
 job_list.each do |job|
   jobs = {
     name: job.css('span.company').text,
     title: job.css('span.title').text
   }
   puts "company: #{jobs[:name]}".red.bold
   puts "role: #{jobs[:title]}".yellow.bold
   puts " "
   sleep(0.7)
 end
end

results(input_category)



