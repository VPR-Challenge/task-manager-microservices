class ScrapingJob < ApplicationJob
  queue_as :default

  def perform(url)
    scraper = ScraperService.new(url)
    scraper.perform
  end
end
