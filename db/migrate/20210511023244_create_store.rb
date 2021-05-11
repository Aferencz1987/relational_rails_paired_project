class CreateStore < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.integer :distance
      t.string :name
      t.string :open
    end
  end
end
