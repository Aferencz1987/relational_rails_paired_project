class CreateTool < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.integer :store
      t.string :type
      t.float :price
      t.boolean :on_sale
      t.timestamps
    end
  end
end
