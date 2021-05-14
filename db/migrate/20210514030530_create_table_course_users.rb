class CreateTableCourseUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :course_users, id: false do |t|
      t.belongs_to :course, null: false
      t.belongs_to :user, null: false
      t.integer :role, null: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
