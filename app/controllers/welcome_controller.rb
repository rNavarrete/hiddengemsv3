class WelcomeController < ApplicationController
  def index
  	if params[:query]
  	  @search = 1	
  	  @items = Video.all	
  	  @videos = Video.advanced_search(params[:query]).tally( :at_least => 1, :limit => 5, :order => 'vote_count desc').page(params[:page]).per_page(9)  
  	else
      @items = Video.all
      @videos = Video.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 9)
    end  
  end
end
