class AddTimestamp < ActiveRecord::Migration[5.2]
  def change
    change_table :manufacturers do |t|
      t.timestamps
    end
  end
end
