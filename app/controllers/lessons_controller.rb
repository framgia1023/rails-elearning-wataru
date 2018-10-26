class LessonsController < ApplicationController

	def create
		@lesson = Lesson.new(lesson_params)
		if @lesson.save
		   redirect_to new_lesson_answer_path(@lesson)
		else
		   redirect_to lesson(@lesson)
		end
	end

	def show
		 @lesson = Lesson.find(params[:id])
		 @answers = @lesson.answers
		 @category = Category.find_by(id: @lesson.category_id)
		 
		 
		# @category = Category.find_by(id: @lesson.category_id)
		# @words = @category.words
		# @choices = choices(choice_params)
		
	end


	private
	def lesson_params
		params.permit(:user_id, :category_id)
		#params.permit(:category_id).merge(user_id: params[:current_user.id])
		# index.html.erb categories で　<%= hidden_field_tag :user_id, current_user.id %> を書かない場合、mergeを使用する。
	end
end
