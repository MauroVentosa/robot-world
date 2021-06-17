class AddLocationReferenceToPart < ActiveRecord::Migration[6.1]
  def change
    add_reference :parts, :location, null: false, foreign_key: true
  end
end
