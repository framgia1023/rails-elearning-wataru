class CategoriesController < ApplicationController

	def index
		@categories = Category.paginate(page: params[:page], per_page: 4)
		@lesson = Lesson.new

	end

	# def create
	# 	@lesson = Lesson.new(lesson_params)
	# end

	# private
	# def lesson_params
	# 	params.require(:lesson).permit(:user_id, :category_id)
	# end

	# private
	# def lesson_params
	# 	params.require(:lesson).permit(:id, :user_id,).merge(category_id: params[:category_id])
	# end

end

