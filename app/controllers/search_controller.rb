class SearchController < ApplicationController
  require 'pry'
  require 'giphy_search.rb'


  def index
    @search = Search.new
    @background_gif = GiphySearch.random_gif(GIPHY_TOKEN)
    unless params[:search].nil? || params[:search][:gif_search_query].empty?
      search_results = GiphySearch.search_keywords(params[:search][:gif_search_query], GIPHY_TOKEN)
      @gifs_array = parse_search_results(search_results)
    end
  end

  def parse_search_results(search_results)
    unless search_results.nil?
      array = []
      search_results["data"].each do |gif|
        array << {gif_static: gif["images"]["fixed_height_still"]["url"],
                  gif_motion: gif["images"]["fixed_height"]["url"], gif_id: gif["id"].to_s}
      end
      array.shuffle
    end
  end
end
