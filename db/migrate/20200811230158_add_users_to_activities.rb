class AddUsersToActivities < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_reference :activities, :user, null: false, index: {algorithm: :concurrently}
  end
end
