class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer :sleep
      t.integer :work
      t.integer :exercise
      t.integer :cook
      t.integer :watch
      t.integer :read

      t.timestamps
    end
  end
end
