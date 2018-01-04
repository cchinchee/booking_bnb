class UsersController < Clearance::UsersController
	
	

	def show
		@user = User.find_by(id: params[:id])
		@verified_listings = Listing.where(status: 1, user_id: @user.id)
		@draft_listings = Listing.where(status: 0, user_id: @user.id)
	end 

	def user_from_params
	    email = user_params.delete(:email)
	    password = user_params.delete(:password)
	    gender = user_params.delete(:gender)
	    name = user_params.delete(:name)


	    Clearance.configuration.user_model.new(user_params).tap do |user|
	      user.email = email
	      user.password = password
	      user.gender = gender
	      user.name = name
	    end
	end

	def url_after_create
		user_path(@user.id)
	end
end


