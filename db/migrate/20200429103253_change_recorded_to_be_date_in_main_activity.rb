class ChangeRecordedToBeDateInMainActivity < ActiveRecord::Migration[6.0]
  def change
    change_column :main_activities, :recorded, :date
  end
end
