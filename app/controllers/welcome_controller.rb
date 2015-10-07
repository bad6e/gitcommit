class WelcomeController < ApplicationController
  def index
    @group = Welcome.new.sort
  end
end
