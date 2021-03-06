class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable try this
	devise	:database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	has_many :orders
	has_many :comments
	has_many :posts
	has_many :recipes
end