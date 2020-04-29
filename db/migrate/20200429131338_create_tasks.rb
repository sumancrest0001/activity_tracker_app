class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :sleep
      t.integer :work
      t.integer :cook
      t.integer :exercise
      t.integer :watch
      t.integer :read
      t.references :main_activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
