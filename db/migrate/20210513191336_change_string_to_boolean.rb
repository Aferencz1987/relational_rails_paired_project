class ChangeStringToBoolean < ActiveRecord::Migration[5.2]
  def change
    remove_column :stores, :open, :string
    add_column :stores, :open, :boolean
  end
end
