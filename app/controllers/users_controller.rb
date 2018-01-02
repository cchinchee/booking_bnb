class UsersController < Clearance::UsersController
	def show
		@user = User.find_by(id: params[:id])
	end 
end


