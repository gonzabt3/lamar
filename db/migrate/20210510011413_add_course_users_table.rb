class AddCourseUsersTable < ActiveRecord::Migration[6.1]
  create_table :course_users, id: false do |t|
    t.belongs_to :course
    t.belongs_to :user
  end
end
