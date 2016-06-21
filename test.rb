require 'httparty'

url = 'http://reddit.com/.json'
response = HTTParty.get(url)
parsed = response.parsed_response
@listings = Array.new

for x in 1..24
  title = parsed['data']['children'][x]['data']['title']
  puts x
  puts @listings
  @listings.push(title)
end
puts @listings