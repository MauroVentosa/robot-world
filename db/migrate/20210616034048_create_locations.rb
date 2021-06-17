class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :factory, null: false, foreign_key: true
      t.integer :build_order
      t.timestamps
    end
  end
end
