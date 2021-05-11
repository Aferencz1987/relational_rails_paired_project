class CreateManufacturer < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :brand
      t.integer :days_since_last_incident
      t.boolean :domestic
    end
  end
end
