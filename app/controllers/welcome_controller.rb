class WelcomeController < ApplicationController

  def index
    urls = ["https://github.com/bad6e",
            "https://github.com/roseak",
            "https://github.com/mcschatz",
            "https://github.com/travishaby"]

    @text = urls.map do |url|
      Nokogiri::HTML(open(url))
    end


  end
end
