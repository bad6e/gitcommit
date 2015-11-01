desc "Update user commits"
task :update_commits => :environment do
  puts "To Infinity and Beyond!"
  require 'nokogiri'
  require 'open-uri'
  require 'hurley'

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
    Nokogiri::HTML(open(url)).css(".contrib-column").css(".table-column").css(".contrib-number")[1].text.strip.gsub("days","").rstrip.to_i
  end
  puts "Mapped Streaks"

  #Current Streaks
  @current_streaks = @urls.map do |url|
    Nokogiri::HTML(open(url)).css(".contrib-column").css(".table-column").css(".contrib-number")[2].text.strip.gsub("days","").rstrip.to_i
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

  @members = GlobalConstants::USERS

  class CommitMessages

    attr_reader :connection

    def initialize
      @connection = Hurley::Client.new("https://api.github.com")
    end

    def commit_message(user)
      list = parse(connection.get("/users/#{user}/events"))
      if list == "[]"
        ["User has no events"]
      else
        find_events_from_list(list)
      end
    end

    def find_events_from_list(list)
      events = list.select { |item| item[:type] == "PushEvent" }
      if events == []
        ["User has no Push Events"]
      else
        find_commits_from_events(events)
      end
    end

    def find_commits_from_events(events)
      commits = events.map{ |event| event[:payload][:commits] }.flatten!
      if commits.nil?
        ["User has no commits"]
      else
        find_messages_from_commits_user(commits)
      end
    end

    def find_messages_from_commits_user(commits)
      messages  = commits.collect{ |commit| commit[:message] }
      if messages == "[]"
        ["User has no commit messages"]
      else
        messages[0..9]
      end
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  @commit_messages = @members.map do |member|
    CommitMessages.new.commit_message(member)
  end

  #Join Stats with Commit Messages
  results = final.zip(@commit_messages)

  results = results.map do |stat|
    stat.flatten
  end

  #Save information to the database
  results.each do |result|
    Stat.create(name: result[0], commits: result[1], streaks: result[2], current_streaks: result[3], commit_messages: result[4..-1])
    puts "creating #{result[0]} with #{result[1]}commits and a longest streak of #{result[2]} days and a current streak of #{result[3]} days and commit messages of #{result[4..-1]}"
  end

  puts "All done Mr. Doucette"
end