desc "Update user commits"
task :update_commits => :environment do
  puts "To Infinity and Beyond!"
  require 'nokogiri'
  require 'open-uri'

  Stat.delete_all
  puts "Deleted old commits"

  @urls = GlobalConstants::URLS

  # Total Commits
  @names = @urls.map do |url|
    Nokogiri::HTML(open(url)).at_css(".vcard-fullname").text.strip
  end
  puts "Mapped Names"

  @commits = @urls.map do |url|
    Nokogiri::HTML(open(url)).at_css(".contrib-number").text.gsub("total","").rstrip.gsub(",","").to_i
  end
  puts "Mapped Commits"

  #Longest Streak
  @streaks = @urls.map do |url|
    Nokogiri::HTML(open(url)).css(".contrib-column").css(".table-column").css(".contrib-number")[1].text.strip.gsub("days","").rstrip
  end
  puts "Mapped Streaks"

  #Current Streak
  @current_streaks = @urls.map do |url|
    Nokogiri::HTML(open(url)).css(".contrib-column").css(".table-column").css(".contrib-number")[2].text.strip.gsub("days","").rstrip
  end
  puts "Mapped Current Streaks"

  #Parse data into appropiate formats
  join_1 = @names.zip(@commits)
  join_2 = join_1.zip(@streaks)

  join_2 = join_2.map do |stat|
    stat.flatten
  end

  final = join_2.zip(@current_streaks)

  final = final.map do |stat|
    stat.flatten
  end

  #Save information to the database
  final.each do |stat|
    stat.flatten
    Stat.create(name: stat[0], commits: stat[1], streaks: stat[2], current_streaks: stat[3])
    puts "creating #{stat[0]} with #{stat[1]}commits and a longest streak of #{stat[2]} days and a current streak of #{stat[3]} days"
  end

  puts "All done Mr. Doucette"
end