class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_oauth(oauth)

    if @user
      log_in(user)
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def oauth
      request.env['omniauth.auth']
    end
end
