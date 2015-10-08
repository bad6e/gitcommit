## Git Commit Tracker for Turing School Cohort 1507

To use this application first clone/fork it. Once it is on your machine run the following tasks

1. Bundle
2. Rake db:create
3. Rake db:migrate
4. Rake update_commits

Rake update_commits is where all the scraping takes place and saves the information to the database. It is a custom rake file located in lib/tasks.

The website can be found here: [GitCommit1507](http://gitcommit1507.herokuapp.com/). It is setup up using Heroku Scheduler which scrapes the information every hour.

If you wish to add a Github profile to scrape update the global_constants.rb file.

