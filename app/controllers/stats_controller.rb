class StatsController < ApplicationController

  def index
    @stats      = Stat.order(commits: :desc)
    @updated_at = Stat.first.when_created
  end

  private

    def commit_params
      params.require(:record).permit(:name, :commits)
    end
end