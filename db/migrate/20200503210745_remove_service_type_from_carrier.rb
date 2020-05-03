class RemoveServiceTypeFromCarrier < ActiveRecord::Migration[6.0]
  def change
    remove_column :carriers, :service_type, :string
  end
end
