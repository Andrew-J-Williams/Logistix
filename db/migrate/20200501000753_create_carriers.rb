class CreateCarriers < ActiveRecord::Migration[6.0]
  def change
    create_table :carriers do |t|
      t.string :service_type
      t.integer :pending_shipments
      t.integer :delivered_shipments

      t.timestamps
    end
  end
end
