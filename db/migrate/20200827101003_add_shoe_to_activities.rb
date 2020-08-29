class AddShoeToActivities < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :activities, :shoe, index: {algorithm: :concurrently}
  end
end
