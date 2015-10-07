set :environment, "development  "
set :output, "log/cron.log"

every 2.hours do
  rake "db:drop db:create db:migrate update_commits"
  puts "Mary is the best mentor"
end
