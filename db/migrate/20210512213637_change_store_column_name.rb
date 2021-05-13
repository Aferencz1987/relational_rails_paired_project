class ChangeStoreColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tools, :store, :store_id
  end
end
