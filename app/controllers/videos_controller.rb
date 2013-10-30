class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to root_url, notice: 'Video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new', notice: 'Try again.' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  def vote_up
    current_user.vote_exclusively_for(@video = Video.find(params[:video_id]))
     
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js  
        flash[:notice] = "Vote successfully created."

      end
  end          

  def vote_down
    begin
      current_user.vote_exclusively_against(@video = Video.find(params[:video_id]))
      flash[:notice] = "Vote successfully created."
      redirect_to root_url
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end                   
  
  def most_popular
    if params[:query]
      @search = 1
      @items = Video.all  
      @videos = Video.advanced_search(params[:query]).tally( :at_least => 1, :limit => 5, :order => 'vote_count desc').paginate(:page => params[:page], :per_page => 9)    
    else    
      @items = Video.all
      @videos = Video.tally( :at_least => 1, :limit => 5, :order => 'vote_count desc').paginate(:page => params[:page], :per_page => 9)  
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
    params.require(:video).permit(:video_link, :song, :description,:submitted_by, :submitter_id, :artist)
    end
end
