class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
    	t.integer :number
      t.integer :origin_id
      t.integer :destination_id
      t.datetime :datetime
      t.time :duration
      t.timestamps
    end
    add_index :flights, :origin
    add_index :flights, :destination
    add_index :flights, :datetime
  end
end
