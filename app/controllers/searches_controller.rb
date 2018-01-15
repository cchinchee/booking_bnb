class SearchesController < ApplicationController

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		
	end


	
	private

	def search_params
		params.require(:search).permit(:listing_name, :country, :property_type, :price)

	end

end
