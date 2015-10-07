class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'nokogiri'
  require 'open-uri'
end
