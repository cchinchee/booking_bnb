class UserMailer < ApplicationMailer
	def payment_email(customer, email, listing_name)
		@customer = customer
		@listing_name = listing_name
		@email = email
		mail(to: @email, subject: 'Payment Confirmation')
		
	end

	def confirmation_booking(customer, email, listing_name, total_price, id, start_date, end_date, number_of_guests, payment)
		  @customer = customer
		  @email = email
		  @listing_name = listing_name
		  @total_price = total_price
		  @booking_number = id
		  @start_date = start_date
		  @end_date = end_date
		  @number_of_guests = number_of_guests
		  @payment = payment
		  mail(to: @email, subject: "Booking Confirmation #{@booking_number} from Booking BnB")
	end
end


