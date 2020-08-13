class AddCalculatedPaceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :calculated_pace, :decimal
  end
end
