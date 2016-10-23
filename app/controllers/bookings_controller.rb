class BookingsController < ApplicationController
  def new
  	@flight = Flight.find_by(id: flight_number)
  	@booking = Booking.new(flight_id: flight_number)
  	@passengers = no_of_pax.times.map { @booking.passengers.build }
  	@booking.bookings_paxes.build(passenger_id: "1").build_passenger
  	@booking.bookings_paxes.build(passenger_id: "2").build_passenger


  	#debugger
  end

  def create
  	redirect_to '/flights'
  end


  private

  	def flight_number
  		params[:flight][:flight_id]
  	end

  	def no_of_pax
  		params[:people].to_i
  	end
end
