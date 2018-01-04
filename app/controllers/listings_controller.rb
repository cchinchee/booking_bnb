class ListingsController < ApplicationController	
	before_action :require_login, only: [:new, :create, :destroy]	

	def new

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
		@listing = Listing.find_by(id: params[:id])
		
	end

	def update
		if current_user.superadmin?
			listing = Listing.find_by(user_id: params[:user_id], id: params[:id])
			listing.verified!
			redirect_to "/listings/verified"
		else
			flash[:notice] = "Sorry. You are not allowed to perform this action."
        	return redirect_to "/", notice: "Sorry. You do not have the permission to verify a listing."
        end 
	end

	def destroy

	end 

	def listing_params
		# params.inspect
		params.require(:listing).permit(:listing_name, :description, :property_type, :number_of_bedrooms, :number_of_beds, :number_of_guests, :address, :country, :photos)

	end

	
end


