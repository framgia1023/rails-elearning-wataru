class Word < ApplicationRecord

	has_many :choices, dependent: :destroy
	belongs_to :category
	accepts_nested_attributes_for :choices

	validates :content, presence: true

end
