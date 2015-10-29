class StatsController < ApplicationController

  def index
    @stats = StatsPresenter.new
  end

  private

  def commit_params
    params.require(:stat).permit(:name, :commits, :streaks, :current_streaks)
  end
end
