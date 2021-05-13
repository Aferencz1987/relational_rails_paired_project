class AddTimestamp < ActiveRecord::Migration[5.2]
  def change
    change_table :manufacturers do |t|
      t.timestamps null: true # seeing if I can create migration with existing data
    end
  end
end
