class Admin::ChoicesController < ApplicationController

	def new
		@choice = Choice.new
	end

	def create
		@choice = Choice.new(choice_params)
	
	end

	

	def edit
		@choices = Choice.find(choice_params)
	end

	def update
		@choices = Choice.find(choice_params)	
	end

	def destroy
		choices = Choice.find(choice_params)
		choices.destroy
	end


	private

	def choice_params
		params.require(:choice).permit(:id, :content, :correct, :word_id)
	end

end
