require 'selenium-webdriver'
require 'nokogiri'

class ScrapingService
  def run
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--start-maximized')

    driver = Selenium::WebDriver.for :chrome, options: options
    driver.navigate.to 'https://www.webmotors.com.br/comprar/chevrolet/cruze/14-turbo-sport6-rs-16v-flex-4p-automatico/4-portas/2023/55108925?pos=b55108925m:&np=1'

    sleep 3

    begin
      driver.execute_script("var elem = document.getElementById('rAEgjeNxizEuMpy'); if (elem) { elem.parentNode.removeChild(elem); }")
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts "Elemento 'press and hold' não encontrado."
    end

    html = driver.page_source
    document = Nokogiri::HTML(html)

    title_element = document.xpath('//*[@id="VehicleBasicInformationTitle"]')

    if title_element.any?
      title = title_element.text.strip
      puts "Título: #{title}"
    else
      puts "Título não encontrado."
    end

    driver.quit
  end
end
