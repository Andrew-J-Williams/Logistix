class AddDetailsToCarriers < ActiveRecord::Migration[6.0]
  def change
    add_column :carriers, :name, :string
    add_column :carriers, :phone, :string
  end
end
