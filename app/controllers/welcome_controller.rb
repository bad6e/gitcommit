class WelcomeController < ApplicationController

  def index
    urls = ["https://github.com/bad6e",
            "https://github.com/roseak",
            "https://github.com/mcschatz",
            "https://github.com/travishaby",
            "https://github.com/Jpease1020",
            "https://github.com/jphoenix86",
            "https://github.com/HoffsMH",
            "https://github.com/MowAlon",
            "https://github.com/russelleh",
            "https://github.com/jbrr",
            "https://github.com/rasensio1",
            "https://github.com/selfup",
            "https://github.com/dastinnette",
            "https://github.com/mbburch",
            "https://github.com/Kealii",
            "https://github.com/Unsafepond",
            "https://github.com/ChrisCenatie",
            "https://github.com/adamki",
            "https://github.com/plato721",
            "https://github.com/Egogre"
          ]

    text = urls.map do |url|
      Nokogiri::HTML(open(url)).at_css(".vcard-fullname").text.strip
    end

    text1 = urls.map do |url|
      Nokogiri::HTML(open(url)).at_css(".contrib-number").text.gsub("total","").to_i
    end

    join = text.zip(text1)
    @group = join.sort{|a,b| b[1] <=> a[1]}
  end
end
