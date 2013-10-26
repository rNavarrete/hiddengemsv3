module ApplicationHelper
	def youtube_embed(youtube_url)
	if youtube_url[/youtu\.be\/([^\?]*)/]
	  youtube_id = $1
	else
	  # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	  youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	  youtube_id = $5
	end
	%Q{<iframe id="img-responsive" type="text/html" width="200" height="200"
	src="https://www.youtube.com/embed/#{youtube_id}?controls=1&showinfo=0&autohide=1&color=white&theme=light"
	frameborder="0" allowfullscreen></iframe>}
	end
	
	def resource_class 
		User 
	end
	
	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
