class CreateTotals < ActiveRecord::Migration[6.0]
  def change
    create_table :totals do |t|
      t.references :user, null: false, foreign_key: true
      t.date :starting_on, null: false
      t.integer :duration, default: 0
      t.decimal :distance, default: 0
      t.integer :range, null: false

      t.timestamps
    end
  end
end
