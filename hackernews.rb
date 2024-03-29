#!/usr/bin/ruby


# accessing necessary libraries
require 'optparse'
require 'net/http'
require 'json'

# adding the commands for CLI
options = {}

OptionParser.new do |parser|
  # Whenever we see -p or --posts, with an
  # argument, save the argument.
  parser.on('-p', '--posts NUMBER', Integer, 'The number of the Hakernews articles to be listed.') do |n|
    options[:n] = n
  end
end.parse!

# adding a help menu to list valid commands

OptionParser.new do |parser|
  parser.banner = 'hakernews [commands]'

  parser.on('-h', '--help', 'Display this message') do
    puts parser
  end
end.parse!

# API cal
url = URI('https://hacker-news.firebaseio.com/v0/topstories.json')

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request.body = '{}'

top_stories = http.request(request)

# version control

if options[:n].positive? && options[:n] <= 100

  STDOUT.puts(  File.read("banner.txt"))
  STDOUT.puts("Here's today's top stories:")

  # cut JSON array by N requested by user
  output = []
  rank = 0
  top_stories = JSON.parse(top_stories.read_body).first(options[:n])

  # iterating over the JSON array and print each story individualy
  # this improves readability vs one large array
  top_stories.each do |id|
    url = URI("https://hacker-news.firebaseio.com/v0/item/#{id}.json?print=pretty")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)

    story = JSON.parse(http.request(request).read_body)
    story['id'] = { title: story['title'], uri: story['url'], author: story['by'], points: story['score'], comments: story['descendants'], rank: rank += 1 }
    output << story['id']
  end
    STDOUT.puts(JSON.pretty_generate(output))

else # output error to terminal if INT not within range
  STDERR.puts('Error: NUMBER needs to be between 1 and 100')
end
