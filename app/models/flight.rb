class Flight < ApplicationRecord
	belongs_to :from_airport, :class_name => "Airport",    
						 :foreign_key => :origin_id
  belongs_to :to_airport,  :class_name => "Airport",    
  					 :foreign_key => :destination_id
  has_many :bookings            


  scope :dates, -> { select(:datetime).distinct.order('datetime asc') }

  validates :origin_id, presence: true
  validates :destination_id, presence: true
  
  

  def self.unique_formatted #Array of unique dates for date drop down menu
    array = [] 
    self.dates.each do |x| 
    	array << x.format_date unless 
          array.include?(x.format_date)
    end
    return array
  end

  def format_date
    self.datetime.strftime("%d/%m/%Y")
  end

  def format_time
    self.datetime.strftime("%I:%M %P")
  end

  def format_duration
    "#{self.duration.strftime("%l:%M")} hrs" 
  end

  def self.find_flights(date, origin, destination)
    flight_date = Date.strptime(date, "%d/%m/%Y")
    Flight.where('origin_id = ?', origin).
       where('destination_id = ?', destination).
       where(datetime: flight_date.beginning_of_day..flight_date.end_of_day).
       order('datetime asc')
  end

end

