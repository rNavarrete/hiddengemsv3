module ApplicationHelper
	def youtube_embed(youtube_url)
	if youtube_url[/youtu\.be\/([^\?]*)/]
	  youtube_id = $1
	else
	  # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	  youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	  youtube_id = $5
	end
	%Q{<iframe id="ytplayer" type="text/html" width="259" height="208"
	src="https://www.youtube.com/embed/#{youtube_id}?controls=1&showinfo=0&autohide=1&color=white&theme=light"
	frameborder="0" allowfullscreen></iframe>}
	end                         
end
