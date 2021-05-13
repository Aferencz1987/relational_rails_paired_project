class RemoveAColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :tools, :store_id, :integer
    remove_column :guitars, :manufacturer_id, :integer
  end
end
