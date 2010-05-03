class RatingsController < ApplicationController
  def create 
    @plugin = Plugin.find(params[:plugin_id])
    rating = Rating.new(:rating => params[:rating])
    @plugin.ratings << rating
    redirect_to @plugin
  end
end
