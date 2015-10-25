class StatsController < ApplicationController

  def index
    @stats = Stat.new
  end

  private

  def commit_params
    params.require(:record).permit(:name, :commits, :streaks, :current_streaks)
  end
end

