class Choice < ApplicationRecord

	belongs_to :word, optional: true

	validates :content, presence: true

end
