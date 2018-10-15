class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_url
		else
			render "new"
		end
	end

	def index
		#@users = User.all
		@users = User.paginate(page: params[:page], per_page: 5)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
	 		flash[:success] = "User Profile successfully update"
			redirect_to @user
		else
	  		render "edit"
		end	
	end

	private
	  def user_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

end
