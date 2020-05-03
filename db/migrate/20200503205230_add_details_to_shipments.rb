class AddDetailsToShipments < ActiveRecord::Migration[6.0]
  def change
    add_column :shipments, :customer, :string
    add_column :shipments, :address, :string
    add_column :shipments, :contact, :string
  end
end
