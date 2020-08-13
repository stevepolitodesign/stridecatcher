class AddPaceAndDateToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :pace, :integer
    add_column :activities, :date, :datetime, null: false
  end
end
