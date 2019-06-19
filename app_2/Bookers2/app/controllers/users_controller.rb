class UsersController < ApplicationController
	before_action :authenticate_user!
	def edit
		@user = User.find(params[:id])
		if @user.id == current_user.id
			@user = User.find(params[:id])
		else
			redirect_to user_path(current_user.id)
		end
	end

	def show
		@user = User.find(params[:id])
		@new_book = Book.new
		@books = @user.books
	end

	def index
		@user = User.find(current_user.id)
		@users = User.all
		@new_book = Book.new
	end

	def update
		@user = User.find(params[:id])
  		if @user.update(user_params)
	  		flash[:notice] = "User was successfully updated."
	  		redirect_to user_path(@user)
	  	else
	  		render :edit
	  	end
  	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
