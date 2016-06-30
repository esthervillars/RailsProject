class UserMailer < ApplicationMailer

	default from: "eaton.cw@gmail.com"
	
	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => 'eaton.cw@gmail.com',
			:subject => "A new contact form message from #{@name}")
			
	end

	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		UserMailer.contact_form(@email, @name, @message).deliver_now
	end
end
