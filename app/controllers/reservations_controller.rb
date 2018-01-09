class ReservationsController < ApplicationController
	before_action :require_login, only: [:new, :create, :destroy]
	before_action :find_listing, only: [:new, :show, :edit, :destroy, :create]	
	before_action :find_reservation, only: [:payment, :checkout]

	def new
		@reservation = Reservation.new(reservation_params)
		@listing = Listing.find_by(id: reservation_params[:listing_id])

	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			
			redirect_to "/users/#{current_user.id}", :flash => { :success => "Booking Confirmed!"}
		else
		
			redirect_to "/listings/#{@reservation.listing_id}", :flash => { :errors => "#{@reservation.errors.full_messages}"}
		end 	
	end



	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to "/users/#{@reservation.user_id}"
	end
	
	def payment
		@client_token = Braintree::ClientToken.generate
	end

	def checkout
		nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

		result = Braintree::Transaction.sale(
		  :amount => "#{@reservation.total_price}",
		  :payment_method_nonce => 'fake-valid-nonce',
		  :options => {
		    :submit_for_settlement => true
		  }
		)

		if result.success?
			@reservation.paid!
			redirect_to :root, :flash => { :success => "Transaction successful!"}
		else
			redirect_to :root, :flash => { :error => "Transaction failed. Please try again."}
		end 		
	end

	def find_listing
		@listing = Listing.find_by(id: params[:id])
	end

	def find_reservation
		@reservation = Reservation.find_by(id: params[:id])
	end

	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date, :number_of_guests, :user_id, :listing_id)
	end

	
end