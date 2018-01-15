class Search < ApplicationRecord

	def search_listings(title, property_type, country, price)

	        listings = Listing.all

	        listings = listings.where(["listing_name LIKE ?", "%#{title}%"]) if title.present?
	        listings = listings.where(["property_type LIKE ?", property_type]) if property_type.present?
	        listings = listings.where(["country LIKE ?", "%#{country}%"]) if country.present?
	        listings = listings.where(["price <= ?", price]) if price.present?

	        return listings

	    end
end
