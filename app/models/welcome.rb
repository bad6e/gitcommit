class Welcome

  def initialize
    @urls =["https://github.com/bad6e",
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
            "https://github.com/Egogre"]
  end

  def sort
    join_arrays = get_names.zip(get_count)
    join_arrays.sort{|a,b| b[1] <=> a[1]}
  end

  def get_names
    @urls.map do |url|
      open_url(url).at_css(".vcard-fullname").text.strip
    end
  end

  def get_count
    @urls.map do |url|
      open_url(url).at_css(".contrib-number").text.gsub("total","").to_i
    end
  end

  def open_url(url)
    Nokogiri::HTML(open(url))
  end
end