class User < ActiveRecord::Base
  def self.find_or_create_from_oauth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)
    user.email            = oauth.info.email
    user.nickname         = oauth.info.nickname
    user.image_url        = oauth.info.image
    user.token            = oauth.credentials.token
    user.repos            = GithubPresenter.new(user).repos
    user.starred_repos    = GithubPresenter.new(user).starred_repos
    user.organizations    = GithubPresenter.new(user).organizations
    user.commit_messages  = GithubPresenter.new(user).commit
    user.followers        = GithubPresenter.new(user).followers
    user.followees        = GithubPresenter.new(user).followees
    user.save

    user
  end
end
