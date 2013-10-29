class WelcomeController < ApplicationController
  def index
  	if params[:query]
  	  @videos = Video.advanced_search(params[:query])
  	else
      @videos = Video.all
      @items = Video.all
    end  
  end
end
