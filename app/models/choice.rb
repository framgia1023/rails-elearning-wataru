class Choice < ApplicationRecord

	has_many :answers, dependent: :destroy
	has_many :lessons, through: :answers

	belongs_to :word, optional: true

	validates :content, presence: true

end
