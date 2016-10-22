class CreateBookingsPaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings_paxes do |t|
    	t.references :passenger, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true
      t.timestamps
    end
  end
end
