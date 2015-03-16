class GiphySearch

  def self.random_gif(giphy_token)
    url = "http://api.giphy.com/v1/gifs/random?api_key=" + giphy_token + "&rating=y,g,pg,pg-13"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    returned_result = JSON.parse(buffer)
    {background: returned_result["data"]["image_url"], original: returned_result["data"]["image_original_url"] }
  end


  def self.search_keywords(keywords,giphy_token)
    formatted_keywords = keywords.gsub(" ", "+")
    url = "http://api.giphy.com/v1/gifs/search?q=" + formatted_keywords + "&api_key=" + giphy_token + "&limit=100&offset=0"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    returned_result = JSON.parse(buffer)
    if returned_result['data'].empty?
    else
      #build_gif_results(returned_result)
      returned_result
    end
  end

end
