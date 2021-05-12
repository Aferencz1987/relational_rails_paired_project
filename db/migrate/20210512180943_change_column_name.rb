class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tools, :type, :name
  end
end
