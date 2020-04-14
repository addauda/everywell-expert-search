require 'net/http'
require 'json'
require 'nokogiri'
require 'open-uri'

class SyncProfileJob < ApplicationJob
  queue_as :default

  def perform(member)
    # Do something later
    shorten_url(member)
    scrape_topics(member)
  end

  private

  def shorten_url(member)
    url = URI('https://api-ssl.bitly.com/v4/shorten')
    data = { long_url: member.website }

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = 'Bearer 3e014092148e7a4487fd9a83bf30b6db637c6922'
    request.body = data.to_json

    response = https.request(request)

    if response.code == '200'
      response_json = JSON.parse(response.body)
      member.short_url = response_json['link']
      member.save
    end
  end

  def scrape_topics(member)
    # Fetch and parse HTML document
    doc = Nokogiri.HTML(open(member.website))

    doc.css('h1', 'h2', 'h3').each do |header|
      Topic.create(
        content: header.content, heading_tag: header.name, member_id: member.id
      )
    end
  end
end
