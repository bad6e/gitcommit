class Welcome

  def self.open_pages
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
            "https://github.com/dastinnette"
          ]

    text = urls.map do |url|
      Nokogiri::HTML(open(url)).at_css
    end


  end

  def self.name
    @data.at_css(".vcard-fullname").text.strip
  end

  def counter
    @data.at_css(".contrib-number").text.strip
  end

end