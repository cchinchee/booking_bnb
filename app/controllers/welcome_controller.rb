class WelcomeController < ApplicationController
    def index
    	if params[:country]
    		@listings = Listing.where('lower(country) LIKE ? OR lower(listing_name) LIKE ?', "%#{params[:country]}%", "%#{params[:country]}%").page params[:page]
    	else
    		@listings = Listing.order(:listing_name).page params[:page]
    	end
    end

end    

