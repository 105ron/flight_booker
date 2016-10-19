class Airport < ApplicationRecord
	before_save   :upcase_code



	private

    # Converts email to all lower-case.
    def upcase_code
      self.code.upcase!
    end

end
