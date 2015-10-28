class User < ActiveRecord::Base
  def self.find_or_create_from_oauth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    user.update_attributes(

    email:              oauth.info.email,
    nickname:           oauth.info.nickname,
    image_url:          oauth.info.image,
    token:              oauth.credentials.token,
    repos:              GithubPresenter.new(user).repos,
    starred_repos:      GithubPresenter.new(user).starred_repos,
    organizations:      GithubPresenter.new(user).organizations,
    commit_messages:    GithubPresenter.new(user).commit,
    followers:          GithubPresenter.new(user).followers,
    followees:          GithubPresenter.new(user).followees,
    total_commits:      GithubPresenter.new(user).year_commits,
    current_streak:     GithubPresenter.new(user).current_streaks,
    longest_streak:     GithubPresenter.new(user).longest_streaks,
    follower_messages:  GithubPresenter.new(user).followers_activities,

    )

    user
  end
end
