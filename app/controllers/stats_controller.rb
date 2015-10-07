class StatsController < ApplicationController

  def index
    @stats      = Stat.order(commits: :desc)
    @updated_at = Stat.first
  end

  private

    def commit_params
      params.require(:record).permit(:name, :commits)
    end
end