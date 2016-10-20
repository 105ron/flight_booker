class Flight < ApplicationRecord
	belongs_to :from_airport, :class_name => "Airport",    
						 :foreign_key => :origin_id
  belongs_to :to_airport,  :class_name => "Airport",    
  					 :foreign_key => :destination_id
  scope :dates, -> { select(:datetime).distinct.order('datetime asc') }
 # scope :dates2 -> { pluck("distinct date(datetime)").order('datetime asc') }

  validates :origin_id, presence: true
  validates :destination_id, presence: true
  
  def self.unique_formatted
    array = [] 
    self.dates.each do |x| 
    	array << x.datetime.strftime("%d/%m/%Y") unless 
          array.include?(x.datetime.strftime("%d/%m/%Y"))
    end
    return array
  end

  def self.find_flights(date, origin, destination)
    flight_date = Date.strptime(date, "%d/%m/%Y")
    Flight.where('origin_id = ?', origin).
       where('destination_id = ?', destination).
       where(datetime: flight_date.beginning_of_day..flight_date.end_of_day).
       order('datetime asc')
  end

end

