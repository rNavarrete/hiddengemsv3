class Video < ActiveRecord::Base
 acts_as_voteable
 belongs_to :user

  def self.text_search(query)
    if query.present?
 	    search(query)
    else
 	    scoped
    end
  end 	    	
end
