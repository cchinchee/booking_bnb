class ListingsController < ApplicationController	
	before_action :require_login, only: [:new]
	def new

	end

	def create
		listing = current_user.listings.new(listing_params)
		if listing.save
			flash[:info] = "Listing created"
			redirect_to "/"
		else
			flash[:error] = "Listing not created"
			redirect_to "/listings/new"
		end
	end

	def show
		@listing = Listing.find_by(id: params[:id])
	end

	def listing_params
		# params.inspect
		params.require(:listing).permit(:listing_name, :description, :property_type, :number_of_bedrooms, :number_of_beds, :number_of_guests, :address, :country)

	end

	
end


