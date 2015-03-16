class SearchController < ApplicationController
  require 'pry'


  def index
    flash[:gifs] = nil
    @user = User.new
    @background_gif = User.generate_background
    unless params[:user].nil? || params[:user][:gif_search_query].empty?
      @gifs_array = User.process_query(params)
      flash[:gifs] = "gif results"
    end
  end


end
