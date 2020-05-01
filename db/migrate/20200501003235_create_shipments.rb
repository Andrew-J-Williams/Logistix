class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.integer :quantity
      t.integer :total_weight
      t.date :ship_date
      t.integer :tracking_number
      t.string :status
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
