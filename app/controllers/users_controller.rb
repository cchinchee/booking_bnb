class UsersController < Clearance::UsersController
	before_action :require_login, only: [:edit]
	before_action :find_user, only: [:edit, :update, :media]

	def show
		@user = User.find_by(id: params[:id])
		@verified_listings = Listing.where(status: 1, user_id: @user.id)
		@draft_listings = Listing.where(status: 0, user_id: @user.id)
		@reservation = @user.reservations
	end 


	def edit
		
		if current_user.id == @user.id
			user_path(@user.id)
		else
			redirect_to "/"
		end
	end


	def media
		if current_user.id == @user.id
			user_path(@user.id)
		else
			redirect_to "/"
		end
	end

	def update
		if current_user.id == @user.id
			@user.update(update_params)
			redirect_to "/users/#{@user.id}"
		else
			redirect_to "/"
		end
	end


	def url_after_create
		user_path(@user.id)
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

	def update_params
		params.require(:user).permit(:name, :email, :gender, :password, :avatar, :remove_avatar)
	end
	
	def find_user
		@user = User.find(params[:id])
	end

end


