class CreateMatters < ActiveRecord::Migration[6.1]
  def change
    create_table :matters do |t|
      t.string :name, null: false
      t.boolean :active, default: true
      t.integer :career_id, null: false

      t.timestamps
    end
  end
end
