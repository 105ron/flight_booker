class Booking < ApplicationRecord
	belongs_to :flight
	has_many :bookings_paxes
	has_many :passengers, through: :bookings_paxes
end
