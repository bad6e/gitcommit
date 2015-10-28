class DashboardController < ApplicationController
  def show
    if current_user == nil
      current_user
    else
      @current_user if current_user
      @user_info  ||= UserPresenter.new(current_user)
    end
  end
end
