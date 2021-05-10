class AddProfessorsAndStudentsTables < ActiveRecord::Migration[6.1]
  def change
    create_table :course_professors, id: false do |t|
      t.belongs_to :course
      t.belongs_to :user
    end

    create_table :course_students, id: false do |t|
      t.belongs_to :course
      t.belongs_to :user
    end
  end
end
