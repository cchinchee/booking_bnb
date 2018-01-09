class ListingsController < ApplicationController	
	before_action :require_login, only: [:new, :create, :destroy]
	before_action :find_listing, only: [:show, :edit, :destroy, :update_listing]	

	def new
		@listing = Listing.new
	end

	def create
		listing = current_user.listings.new(listing_params)
		
		if listing.save
			flash[:info] = "Listing created"
			redirect_to "/users/#{current_user.id}"
		else
			flash[:error] = "Listing not created"
			redirect_to "/listings/new"
		end
	end

	def show
		@reservation = Reservation.new

	end

	def edit

	end

	def verify
		if current_user.superadmin?
			listing = Listing.find_by(id: params[:id])
			listing.verified!
			redirect_to "/listings/verified"
		else
			flash[:notice] = "Sorry. You are not allowed to perform this action."
        	return redirect_to "/", notice: "Sorry. You do not have the permission to verify a listing."
        end 
	end

	def destroy

	end 

	def update_listing
		if current_user.id == @listing.user_id
			@listing.update(listing_params)
			redirect_to "/users/#{@listing.user_id}/listings/#{@listing.id}}"
		else
			redirect_to "/"
		end
	end
	
	def find_listing
		@listing = Listing.find_by(id: params[:id])
	end 
	
	def listing_params
		# params.inspect
		params.require(:listing).permit(:listing_name, :description, :property_type, :number_of_bedrooms, :number_of_beds, :number_of_guests, :address, :country, :price, {photos: []})
	end

end


