class UserMailer < ApplicationMailer
	def booking_email(customer, email, listing_name)
		@customer = customer
		@listing_name = listing_name
		@email = email
		mail(to: @email, subject: 'Sample Email')
		
	end
end


