class Course < ApplicationRecord
	has_many :course_users
	has_many :users, through: :course_users

	def add_user(user, role)
		CourseUsers.create(course: self, user: user, role: role)
	end
end
