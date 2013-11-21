class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		password = params[:user].extract!(:password)[:password]
		user = User.new(params[:user])
		user.password = password
		user.save
		redirect_to users_path
	end

	def index
		@users = User.all
	end
end
