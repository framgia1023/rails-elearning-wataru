class AnswersController < ApplicationController

	def new
		@answer = Answer.new
		@lesson = Lesson.find(params[:lesson_id])
		@category = Category.find_by(id: @lesson.category_id)
		@word = @lesson.next_word
	end

	def create
		@answer = Answer.new(answer_params)
		@lesson = Lesson.find(params[:lesson_id])
		@category = Category.find_by(id: @lesson.category_id)
		choice = @lesson.answers.collect{|a| a.choice_id}
		@answer.save
		if   @lesson.next_word.nil?
			 @lesson.update(result: Choice.find(choice).collect{|c| c.correct}.count(true))
			 redirect_to lesson_path(@lesson)
		else 
			 @word = @lesson.next_word
		     redirect_to new_lesson_answer_path(@lesson)
		end

	end


	private
	def answer_params
		params.permit(:lesson_id, :word_id, :choice_id)
	end

	def correct_params
		choices.find_by(correct: true)
	end

	
end
