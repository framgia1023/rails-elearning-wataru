module LessonsHelper

	def show_result(category)
		cat = Lesson.find_by(category_id: category.id, user_id: current_user.id)
		# if !(cat.category_id == category.id && cat.user_id == current_user.id)
		# 	#show learn
		# elsif cat.category_id == category.id && cat.user_id == current_user.id
		# 	#show result
		# end
	end 
end
