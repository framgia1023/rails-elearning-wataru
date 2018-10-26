class Lesson < ApplicationRecord

	has_many :answers
	has_many :words, through: :answers
	has_many :choices, through: :answers

	belongs_to :user
	belongs_to :category

	def next_word
		(category.words - words).first
	end

	def correct
		choices.where(correct: true)
	end
end
