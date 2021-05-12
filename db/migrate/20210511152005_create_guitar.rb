class CreateGuitar < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.float :price
      t.string :model
      t.boolean :sold
    end
  end
end
