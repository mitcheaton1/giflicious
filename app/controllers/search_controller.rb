class SearchController < ApplicationController
  require 'pry'


  def index
    flash[:gifs] = nil
    @search = Search.new
    @background_gif = Search.generate_background
    unless params[:search].nil? || params[:search][:gif_search_query].empty?
      process_query_results = Search.process_query(params)
      @gifs_array = Search.build_gif_results(process_query_results)
      flash[:gifs] = "gif results"
    end
  end


end
