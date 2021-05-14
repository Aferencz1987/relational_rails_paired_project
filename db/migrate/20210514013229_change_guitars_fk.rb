class ChangeGuitarsFk < ActiveRecord::Migration[5.2]
  def change
    rename_column :guitars, :manufacturers_id, :manufacturer_id
  end
end
