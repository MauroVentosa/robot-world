class CreateCarParts < ActiveRecord::Migration[6.1]
  def change
    create_table :car_parts do |t|
      t.belongs_to :car
      t.boolean :defect
      t.belongs_to :part
      t.timestamps
    end
  end
end
