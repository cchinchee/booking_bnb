class ReservationsController < ApplicationController
	before_action :require_login, only: [:new, :create, :destroy]
	before_action :find_reservation, only: [:new, :show, :edit, :destroy, :create]	

	def new
		@reservation = Reservation.new(reservation_params)
		@listing = Listing.find_by(id: reservation_params[:listing_id])

	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		if @reservation.save
			flash[:info] = "Booking Confirmed"
			redirect_to "/users/#{current_user.id}"
		else
			@errors = @reservation.errors.full_messages
			redirect_to "/listings/#{@reservation.listing_id}"
		end 	

	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to "/users/#{@reservation.user_id}"
	end

	def find_reservation
		@listing = Listing.find_by(id: params[:id])

	end

	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date, :number_of_guests, :user_id, :listing_id)
	end

	
end