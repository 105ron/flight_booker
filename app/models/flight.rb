class Flight < ApplicationRecord
	belongs_to :from_airport, :class_name => "Airport",    :foreign_key => :origin_id
  belongs_to :to_airport,  :class_name => "Airport",    :foreign_key => :destination_id
  validates :origin_id, presence: true
  validates :destination_id, presence: true

end
