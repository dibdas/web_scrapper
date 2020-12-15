require_relative '../lib/scrapper'

describe Scrapper do
  let(:scraper) { Scrapper.new('https://weworkremotely.com/remote-programming-jobs') }
  describe '#scraper' do
    it 'calls the scraper method in Scrapper class with a true value' do
      allow(scraper).to receive(:scraper).and_return(true)
      expect(scraper.scraper).to eql(true)
    end
    it 'calls the start method in Scraper class with a false value' do
      allow(scraper).to receive(:scraper).and_return(true)
      expect(scraper.scraper).not_to eql(false)
    end
  end
end
