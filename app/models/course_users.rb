class CourseUsers < ApplicationRecord
  belongs_to :course
  belongs_to :user
  belongs_to :role

  validate :user_is_not_in_the_course_already?, on: :create

  private

  def user_is_not_in_the_course_already?
    if CourseUsers.where(course: course, user: user).any?
      errors.add(:base, "This user is already in this course")
    end
	end

end