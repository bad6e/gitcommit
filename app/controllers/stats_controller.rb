class StatsController < ApplicationController

  def index
    @stats = StatsPresenter.new
  end

  def show
    @stats     = StatsPresenter.new
    @stat_user = Stat.find(params[:id])
  end

  private

  def commit_params
    params.require(:stat).permit(:name, :commits, :streaks, :current_streaks, :commit_messages)
  end
end
