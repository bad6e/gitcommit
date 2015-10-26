class DashboardController < ApplicationController
  def show
    @current_user
    @info       ||= Github.new(current_user)
  end
end
