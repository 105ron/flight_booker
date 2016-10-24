class Booking < ApplicationRecord
	belongs_to :flight
	has_many :bookings_paxes, inverse_of: :passenger
	has_many :passengers, through: :bookings_paxes
	accepts_nested_attributes_for :passengers
end
