class StatsController < ApplicationController

  def index
    @stats      = Stat.order(commits: :desc)
    @streaks    = Stat.order(streaks: :desc)
    @updated_at = Stat.first.when_created
  end

  private

    def commit_params
      params.require(:record).permit(:name, :commits, :streaks)
    end
end