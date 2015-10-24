class StatsController < ApplicationController

  def index
    # git = GithubService.new

    # @message = git.find_users_commits
    @stats           = Stat.order(commits: :desc)
    @streaks         = Stat.order(streaks: :desc)
    @current_streaks = Stat.order(current_streaks: :desc)
    @updated_at       = Stat.first.when_created
  end

  private

  def commit_params
    params.require(:record).permit(:name, :commits, :streaks, :current_streaks)
  end
end

