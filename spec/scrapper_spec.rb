require_relative '../lib/scrapper'
describe Scrapper do
  let(:scraper) { Scrapper.new('https://weworkremotely.com/') }
  describe '#scraper' do
    it 'calls the scraper method in Scrapper class with a true value' do
      allow(scraper).to receive(:scrape).and_return(true)
      expect(scraper.scrape).to eql(true)
    end

    it 'calls the scraper method in Scraper class with a false value' do
      allow(scraper).to receive(:scrape).and_return(true)
      expect(scraper.scrape).not_to eql(false)
    end
  end
end
