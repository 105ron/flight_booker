class Passenger < ApplicationRecord
	has_many :bookings_paxes
	has_many :bookings, through: :bookings_paxes
	
end
