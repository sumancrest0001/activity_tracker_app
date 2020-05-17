class CreateMainActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :main_activities do |t|
      t.string :title
      t.datetime :recorded
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
