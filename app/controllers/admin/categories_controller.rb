class Admin::CategoriesController < ApplicationController

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to admin_categories_path
		else
			render root_url
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
			redirect_to admin_categories_path
		else
			render edit_admin_category_path
		end
	end

	def destroy
		 category = Category.find(params[:id])
	     category.destroy 
	     redirect_to admin_categories_path
	end


	private

	  def category_params
	    params.require(:category).permit(:title, :description)
	  end



end
