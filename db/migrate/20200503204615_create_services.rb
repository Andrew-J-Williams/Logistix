class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :name
      t.belongs_to :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
