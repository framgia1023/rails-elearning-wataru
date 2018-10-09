class User < ApplicationRecord

	#before_save { self.email = email.downcase }
	before_save { email.downcase! }

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i			
	validates :name ,presence: true ,length: { minimum: 3,maximum: 20 }
	validates :email ,	presence: true ,	
						length: { minimum: 5,maximum: 40 },
						format: { with: EMAIL_REGEX},
						uniqueness: { case_sensitive: false }

	has_secure_password	

end
