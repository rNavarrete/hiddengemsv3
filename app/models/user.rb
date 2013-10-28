class User < ActiveRecord::Base
  acts_as_voter
  has_many :votes
  has_many :videos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
