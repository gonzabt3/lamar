class DeleteCrossTableCourses < ActiveRecord::Migration[6.1]
  def change
    drop_table :course_professors
    drop_table :course_students
  end
end
