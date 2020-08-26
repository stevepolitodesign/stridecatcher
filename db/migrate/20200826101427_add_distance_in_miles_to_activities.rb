class AddDistanceInMilesToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :distance_in_miles, :decimal, precision: 5, scale: 2
  end
end
