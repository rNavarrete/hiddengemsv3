class Video < ActiveRecord::Base
 acts_as_voteable
 belongs_to :user
end
