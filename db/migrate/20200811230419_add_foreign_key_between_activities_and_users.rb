class AddForeignKeyBetweenActivitiesAndUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :users, validate: false
  end
end
