class AddNotifiedToShoes < ActiveRecord::Migration[6.0]
  def change
    add_column :shoes, :notified, :boolean, default: false
  end
end
