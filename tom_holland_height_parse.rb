require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'xpath'

@parse_page = []
# [] = Array.new

# Tom Holland height data scrape

@tom_holland_url = 'http://www.imdb.com/name/nm4043618/bio?ref_=nm_ov_bio_sm'

@page = HTTParty.get(@tom_holland_url)

@parse_page = Nokogiri::HTML(@page)

# @parse_page = doc.xpath("//*+[contains(concat( " ", @class, " " ), concat( " ", "odd", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "even", " " ))]//*+[contains(concat( " ", @class, " " ), concat( " ", "label", " " ))]//td").collect {|node| node.text.strip}

@toms_height = @parse_page.css(".odd+ .even .label+ td").text

puts "Tom Holland's Height: " + @toms_height
