class ListingsController < ApplicationController
	before_action :find_user, only: [:new]
	def new

	end

	def find_user
		@user=User.find(params[:id])
	end
end
