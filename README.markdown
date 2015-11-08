## API-Curious
### Git Commit 1507

Git Commit is a personalized Git Commit Tracker that displays the following information about your Github account:

* Profile Avatar
* Login Information
* Number of Starred Repositories
* Contribution Summary
* Repository Names
* Who is following you
* Who you are following
* Your organizations
* Your recent commit messages
* Followers recent commit messages

In addition, it tracks my each class member's total commits, current streak, and longest streak. For fun you can also display each class member's latest ten commit messages.

To obtain the commit statistics, I used Nokogiri to scrape profile information. The scraping rake task, 'update_commits' is currently on a Heroku Scheduler that runs the task every three hours.

For the personalized Git information, I consumed the [Github API](https://developer.github.com/v3/) and used Github OAuth to authenticate.

The website can be found here:

[Gitcommit1507.herokuapp.com](https://gitcommit1507.herokuapp.com/)

The original project guideline can be found here:

[Turing School Original Assignment - API Curious](https://github.com/turingschool/curriculum/blob/master/source/projects/apicurious.markdown)
