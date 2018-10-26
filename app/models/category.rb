class Category < ApplicationRecord

	has_many :words, dependent: :destroy
	has_many :choices, through: :words, source: :choice
	has_many :users, dependent: :destroy

	validates :title ,presence: true 
	validates :description ,presence: true 

end
