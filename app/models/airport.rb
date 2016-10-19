class Airport < ApplicationRecord
	before_save   :upcase_code
	has_many :departing_flights, :class_name => "Flight", :foreign_key => :origin_id
  has_many :arriving_flights, :class_name => "Flight", :foreign_key => :destination_id
 # has_many :departing_flights, class_name:  "User",
 #                                  foreign_key: "id"
 # has_many :following, through: :active_relationships,  source: :followed

	private

    # Converts email to all lower-case.
    def upcase_code
      self.code.upcase!
    end

end
