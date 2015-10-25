class DashboardController < ApplicationController
  def show
    @current_user
    @repos      ||= Github.repos(current_user.nickname)
    @followers  ||= Github.followers(current_user.nickname)
    @followees  ||= Github.followees(current_user.nickname)
  end
end
