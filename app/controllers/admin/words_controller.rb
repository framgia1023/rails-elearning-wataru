class Admin::WordsController < ApplicationController

	def index
		@category = Category.find(params[:category_id])
		@words = @category.words.paginate(page: params[:page], per_page: 7)

	end

	def new
		@word = Word.new
		@category = Category.find(params[:category_id])
		3.times {
			@word.choices.build
		}
	end

	def create
		@category = Category.find(params[:category_id])
		@word = @category.words.build(word_params)
		if 	@word.save
			flash[:success] = "Word created"
			redirect_to admin_category_words_path(@category.id)
		else
			render "new"
		end
	end

	def edit
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
		
		# 3.times {
		# 	@word.choices.build
		# }
	end

	def update
		@category = Category.find(params[:category_id])
		@word = Word.find(params[:id])
		if @word.update_attributes(word_params)
		   flash[:success] = "Update successfully"
		   redirect_to admin_category_words_path(@category.id)	     
		else
		   render "edit"
		end
	end

	def destroy
		@category = Category.find(params[:category_id])
		@word = @category.words.find(params[:id])
	    @word.destroy
	    flash[:danger] = "Sucessfully deleted category!" 
	    redirect_to admin_category_words_path(@category.id)
	end


	private

	def word_params
    	params.require(:word).permit(:content, choices_attributes: [:content, :correct, :id])
  	end



end
