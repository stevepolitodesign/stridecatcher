class AddForeignKeysToShoesAndActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :shoes, validate: false
    add_foreign_key :shoes, :users, validate: false
  end
end
