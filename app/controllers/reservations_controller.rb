class ReservationsController < ApplicationController
	before_action :require_login, only: [:new, :create, :destroy]
	before_action :find_reservation, only: [:new, :show, :edit, :destroy]	

	def new
		@reservation = Reservation.new(reservation_params)
		@listing = Listing.find_by(id: reservation_params[:listing_id])

	end

	def create
		if booking.save
			flash[:info] = "Booking Confirmed"
			redirect_to "/users/#{current_user.id}"
		else
			flash[:error] = "Booking not confirmed"
			redirect_to "/users/#{current_user.id}"
		end 	

	end

	def find_reservation
		@listing = Listing.find_by(id: params[:id])

	end

	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date, :number_of_guests, :user_id, :listing_id)
	end

end