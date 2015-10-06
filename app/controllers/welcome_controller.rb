class WelcomeController < ApplicationController

  def index
    url = "https://github.com/bad6e"
    data = Nokogiri::HTML(open(url))
    @name  = data.at_css(".vcard-fullname").text.strip
    @count = data.at_css(".contrib-number").text.strip
  end
end
