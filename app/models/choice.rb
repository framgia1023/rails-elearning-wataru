class Choice < ApplicationRecord

	has_many :answer, dependent: :destroy

	belongs_to :word, optional: true

	validates :content, presence: true

end
