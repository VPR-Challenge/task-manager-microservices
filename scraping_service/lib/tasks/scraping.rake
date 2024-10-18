namespace :scraping do
  desc "Run the web scraping task"
  task run: :environment do
    puts "Iniciando o processo de scraping..."
    require Rails.root.join("app/services/scraping_service")

    ScrapingService.new.run
  end
end
