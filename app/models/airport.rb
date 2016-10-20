class Airport < ApplicationRecord
	before_save   :upcase_code
	has_many :departing_flights, :class_name => "Flight", :foreign_key => :origin_id
  has_many :arriving_flights, :class_name => "Flight", :foreign_key => :destination_id
  scope :names_ordered, -> { select(:id, :name, :code).order('name asc') }

	private

    # Converts email to all lower-case.
    def upcase_code
      self.code.upcase!
    end

end
