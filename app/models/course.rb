class Course < ApplicationRecord
	has_many :course_professors
	has_many :users, through: :course_professors
	

	private
end
