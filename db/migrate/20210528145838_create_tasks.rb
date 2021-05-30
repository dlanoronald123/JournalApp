class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :category_id
      t.string :name
      t.text :description
      t.date :deadline
      t.boolean :done
      t.timestamps
    end
  end
end
