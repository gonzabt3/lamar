class DeleteCourseUsersTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :course_users
  end
end
