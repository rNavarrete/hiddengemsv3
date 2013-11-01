class Video < ActiveRecord::Base
 acts_as_voteable
 belongs_to :user


 validates :artist, length: { maximum: 31, too_long: "%{count} characters is the maximum allowed" } 
 validates :song, length: { maximum: 31 }


  def self.text_search(query)
    if query.present?
 	    search(query)
    else
 	    scoped
    end
  end 	    	
end
