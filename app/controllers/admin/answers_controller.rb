class Admin::AnswersController < ApplicationController

	def index
		category = Category.find(params[:id])
		word = Word.find(params[:id])
		@answer = category.word.answer(answer_params)
	end

	private

	def answer_params
		params.require(:answer).permit(:id, :content, :correct, :word_id, :choice_id)
	end


end
