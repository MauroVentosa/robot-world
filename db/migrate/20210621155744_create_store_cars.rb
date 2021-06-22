class CreateStoreCars < ActiveRecord::Migration[6.1]
  def change
    create_table :store_cars do |t|
      t.integer :price
      t.integer :costPrice
      t.integer :year
      t.boolean :ordered, :default => false
      t.references :car_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
