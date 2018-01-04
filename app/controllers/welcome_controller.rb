class WelcomeController < ApplicationController
    def index
    	@listings = Listing.order(:listing_name).page params[:page]

    end
end    