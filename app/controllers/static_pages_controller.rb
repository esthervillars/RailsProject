class StaticPagesController < ApplicationController

  def index
  end
  
  def contact
  end
	
	def about
	end 

	def landing_page
		@products = Product.limit(6)
	end

	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		ActionMailer::Base.email(:from => @email,
			:to => 'eaton.cw@gmail.com',
			:subject => "A new contact form message from #{@name}",
			:body => @message).deliver_now
	end
end
