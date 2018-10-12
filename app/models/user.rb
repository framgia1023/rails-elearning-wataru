class User < ApplicationRecord

	has_many :active_relationships, class_name: "Relationship",
									foreign_key: "follower_id",
									dependent: :destroy
	has_many :following, through: :active_relationships, source: :followed

	has_many :passive_relationships, class_name: "Relationship",
										foreign_key: "followed_id",
										dependent: :destroy
	has_many :followers, through: :passive_relationships, source: :follower

	#before_save { self.email = email.downcase }
	before_save { email.downcase! }

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i			
	validates :name ,presence: true ,length: { minimum: 3,maximum: 20 }
	validates :email ,	presence: true ,	
						length: { minimum: 5,maximum: 40 },
						format: { with: EMAIL_REGEX},
						uniqueness: { case_sensitive: false }

	has_secure_password

	# user.following.include?(other_user)
	# user.following.find(other_user)
	# user.following << other_user
	# user.following.delete(other_user)	

	def follow(other_user)
		following << other_user	
		#active_relationship.create(followed_id: other_user.id)						
	end	

	def unfollow(other_user)
		following.delete(other_user)
	end

	
	def following?(other_user)
		following.include?(other_user)
	end			

	def feed
		following_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
	end	

end
