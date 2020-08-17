class AddHoursMinutesAndSecondsToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :hours, :integer
    add_column :activities, :minutes, :integer
    add_column :activities, :seconds, :integer
  end
end
