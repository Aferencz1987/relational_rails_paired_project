class ChangeToolsFk < ActiveRecord::Migration[5.2]
  def change
    rename_column :tools, :stores_id, :store_id
  end
end
