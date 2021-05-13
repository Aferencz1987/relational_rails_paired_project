class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :tools, :stores, foreign_key: true
    add_reference :guitars, :manufacturers, foreign_key: true
  end
end
