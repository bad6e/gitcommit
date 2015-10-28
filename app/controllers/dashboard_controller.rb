class DashboardController < ApplicationController
  def show
    @current_user
    @user_info  ||= UserPresenter.new(current_user)
  end
end
