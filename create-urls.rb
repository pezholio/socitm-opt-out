# Create urls.json file from tsv file of council urls

# $ ruby create-urls.rb councils.tsv > urls.json

require 'json/pure'

urls = []

ARGF.each do |line|
  line.strip!
  domain = line.sub(/https?:\/\//, '').sub(/\/$/, '')

  urls << {
    'url' => (line + '/').sub(/\/+$/, '/'), # make all URLs end with a /
    'domain' => domain
  }
end

puts "urls = " + JSON.pretty_generate(urls)
