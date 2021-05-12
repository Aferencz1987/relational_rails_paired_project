class AddColumnsToGuitar < ActiveRecord::Migration[5.2]
  def change
    change_table :guitars do |t|
      t.integer :manufacturer
      t.timestamps
    end
  end
end
