desc "Update user commits"
task :update_commits => :environment do
  puts "To Infinity and Beyond!"
  require 'nokogiri'
  require 'open-uri'
  require 'pry'

  Stat.delete_all
  puts "Deleted old commits"


  @urls = GlobalConstants::URLS

  # Total Commits
  @names = @urls.map do |url|
    Nokogiri::HTML(open(url)).at_css(".vcard-fullname").text.strip
  end
  puts "Mapped Names"

  @commits = @urls.map do |url|
    Nokogiri::HTML(open(url)).at_css(".contrib-number").text.gsub("total","")
  end
  puts "Mapped Commits"

  #Longest Streak
  @streaks = @urls.map do |url|
    Nokogiri::HTML(open(url)).css(".contrib-column").css(".table-column").css(".contrib-number")[1].text.strip.gsub("days","").rstrip
  end
  puts "Mapped Streaks"

  join = @names.zip(@commits)
  final = join.zip(@streaks)

  final = final.map do |stat|
    stat.flatten
  end

  final.each do |stat|
    stat.flatten
    Stat.create(name: stat[0], commits: stat[1], streaks: stat[2])
    puts "creating #{stat[0]} with #{stat[1]}commits and a streak of #{stat[2]} days"
  end










  puts "All done Mr. Doucette"
end