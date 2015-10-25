class DashboardController < ApplicationController
  def show
    @current_user
    @repos = Github.repos(current_user.nickname)
  end
end
