class ChangeManufacturerColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :guitars, :manufacturer, :manufacturer_id
  end
end
