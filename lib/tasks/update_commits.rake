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
    Nokogiri::HTML(open(url)).at_css(".contrib-number").text.gsub("total","")
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

  join = @names.zip(@commits)
  final = join.zip(@streaks)

  final = final.map do |stat|
    stat.flatten
  end

  real_final = final.zip(@current_streaks)


  real_final = real_final.map do |stat|
    stat.flatten
  end

  real_final.each do |stat|
    stat.flatten
    Stat.create(name: stat[0], commits: stat[1], streaks: stat[2], current_streaks: stat[3])
    puts "creating #{stat[0]} with #{stat[1]}commits and a l
          ongest streak of #{stat[2]} days and a current streak of #{stat[3]} days"
  end

  puts "All done Mr. Doucette"
end