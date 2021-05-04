class CreateCareers < ActiveRecord::Migration[6.1]
  def change
    create_table :careers do |t|
      t.string :name, null: false
      t.boolean :active, dafualt: true
      t.integer :university_id, null: false

      t.timestamps
    end
  end
end
