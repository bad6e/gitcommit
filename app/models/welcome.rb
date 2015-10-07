class Welcome
  def initialize
    @urls = GlobalConstants::URLS
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