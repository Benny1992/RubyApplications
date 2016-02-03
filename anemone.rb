require 'anemone'

Anemone.crawl("http://bennyklotz.at/") do |anemone|
  anemone.on_every_page do |page|
    puts page.url
    p page.body
  end
end
