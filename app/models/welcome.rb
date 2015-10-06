class Welcome

  def self.open_pages
    urls = ["https://github.com/bad6e",
            "https://github.com/roseak",
            "https://github.com/mcschatz",
            "https://github.com/travishaby"]

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