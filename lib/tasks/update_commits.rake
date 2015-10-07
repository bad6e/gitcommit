desc "Update user commits"
task :update_commits => :environment do
  puts "To Infinity and Beyond!"
  require 'nokogiri'
  require 'open-uri'

  Stat.delete_all

  @urls = GlobalConstants::URLS

  @names = @urls.map do |url|
    Nokogiri::HTML(open(url)).at_css(".vcard-fullname").text.strip
  end

  @commits = @urls.map do |url|
    Nokogiri::HTML(open(url)).at_css(".contrib-number").text.gsub("total","")
  end

  join = @names.zip(@commits)

  join.each do |stat|
    Stat.create(name: stat[0], commits: stat[1])
    puts "creating #{stat[0]} with commits #{stat[1]}"
  end

  puts "All done Mr. Doucette"
end