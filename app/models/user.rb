class User < ActiveRecord::Base

  attr_accessible :gif_search_query


  def self.generate_background
    url = "http://api.giphy.com/v1/gifs/random?api_key=" + GIPHY_TOKEN + "&rating=y,g,pg,pg-13"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    returned_result = JSON.parse(buffer)
    {background: returned_result["data"]["image_url"], original: returned_result["data"]["image_original_url"] }
  end


def self.process_query(params)
    keywords = params[:user][:gif_search_query].gsub(" ", "+")
    url = "http://api.giphy.com/v1/gifs/search?q=" + keywords + "&api_key=" + GIPHY_TOKEN + "&limit=100&offset=0"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    returned_result = JSON.parse(buffer)
    if returned_result['data'].empty?
    else
      build_gif_results(returned_result)
    end
  end

  def self.build_gif_results(gif_hash)
    array = []
    gif_hash["data"].each do |gif|
      gif_static = gif["images"]["fixed_height_still"]["url"]
      gif_motion = gif["images"]["fixed_height"]["url"]
      gif_id = gif["id"].to_s
      array << {gif_static: gif_static, 
       gif_motion: gif_motion, gif_id: gif_id}
    end
    array.shuffle
  end
end
