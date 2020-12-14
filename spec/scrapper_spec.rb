
require_relative '../lib/scrapper.rb'
describe Scrapper do
        let(:scraper) { Scrapper.new('https://weworkremotely.com/') }
        describe '#scraper' do
            it 'calls the scraper method in Scrapper class with a true value' do
                allow(scraper).to receive(:scrape).and_return(true)
                expect(scraper.scrape).to eql(true)
              end
        end
    
end
            
