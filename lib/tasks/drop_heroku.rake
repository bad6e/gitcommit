desc "drops heroku database"
task :drop_heroku => :environment do
  puts "Dropping Heroku Database"
  `heroku pg:reset DATABASE_URL`
end