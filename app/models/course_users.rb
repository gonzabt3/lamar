class CourseUsers < ApplicationRecord
  belongs_to :course
  belongs_to :user
  belongs_to :role

end