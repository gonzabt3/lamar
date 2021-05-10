class Course < ApplicationRecord
	has_many :course_professors
	has_many :users, through: :course_professors
	
	has_many :course_students
	has_many :users, through: :course_students
	

	def add_professors(professors)
		professors.each do |professor|
			unless has_student?(professor)
				CourseProfessor.create(course: self, user: professor)
			end
		end
	end

	def add_students(students)
		students.each do |student|
			unless has_professor?(student)
				CourseStudent.create(course: self, user: student)
			end
		end
	end

	private

	def has_student?(user)
		CourseStudent.where(course: self, user: user).any?
	end

	def has_professor?(user)
		CourseProfessor.where(course: self, user: user).any?
	end
end
