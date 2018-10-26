class Word < ApplicationRecord

	has_many :choices, dependent: :destroy
	has_many :answers, dependent: :destroy
	has_many :lessons, through: :answers
	belongs_to :category
	accepts_nested_attributes_for :choices
	validate :one_collect
	validates :content, presence: true

	def correct_params
		choices.find_by(correct: true)
	end

	private

	def one_collect

		if  choices.collect{|c| c.correct}.count(true) == 0
			errors.add(:choice, "should have one checked")


		elsif  choices.collect{|c| c.correct}.count(true) > 1
			   errors.add(:choice, "should have only one checked")
		
		end

	end

end
