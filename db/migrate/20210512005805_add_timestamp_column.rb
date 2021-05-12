class AddTimestampColumn < ActiveRecord::Migration[5.2]
  def change
    change_table :stores do |t|
      t.timestamps
    end
  end
end
