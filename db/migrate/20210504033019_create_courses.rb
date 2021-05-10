class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :comision_name, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
