class Post < ActiveRecord::Base
	has_many :comments, as: :commentable
	

	validates :title, presence: true, length: { minimum: 5 }
	validates :img_url, presence: true
	validates :body, presence: true
end
