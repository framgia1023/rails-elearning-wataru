class Admin::CategoriesController < ApplicationController

	before_action :require_admin


	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Create successfully!" 
			redirect_to admin_categories_path
		else
			render "new"
		end
	end

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			flash[:success] = "Update complete!"
			redirect_to admin_categories_path
		else
			render "edit"
		end
	end

	def destroy
		 category = Category.find(params[:id])
	     category.destroy
	     flash[:danger] = "Sucessfully deleted word!" 
	     redirect_to admin_categories_path
	end

	def show

	end


	private

	  def category_params
	    params.require(:category).permit(:title, :description)
	  end

	  def require_admin
    	redirect_to root_url unless current_user.admin?
	  end

end
