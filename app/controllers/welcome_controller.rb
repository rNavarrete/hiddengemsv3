class WelcomeController < ApplicationController
  def index
    @videos = Video.all
    @items = Video.all
  end
end
