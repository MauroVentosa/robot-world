class AddTerminalToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :terminal, :boolean
  end
end
