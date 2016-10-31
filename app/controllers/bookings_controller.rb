class BookingsController < ApplicationController
  def new
  	@flight = Flight.find_by(id: flight_number)
  	@booking = Booking.new(flight_id: flight_number) #uncomnet for errors
  	@passengers = no_of_pax.times.map { @booking.passengers.build }
  	#debugger
  end

  def create
    @booking = Booking.create(flight_id: params[:booking][:flight_id])
    params[:booking][:passenger].each do |x|
      @passenger = Passenger.find_by(email: x[:email])
      if @passenger
        #create new relationship for exist passenger
        BookingsPax.create(passenger_id: @passenger.id, booking_id: @booking.id)
        ConfirmationMailer.confirmation_email(@passenger, @booking).deliver_now
      else
        #create new passenger and relationship
        pax = @booking.passengers.create(name: x[:name], email: x[:email])
        ConfirmationMailer.confirmation_email(pax, @booking).deliver_now
      end
    end
  	redirect_to @booking
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end


  private
      def iteratate
        params[:booking][:passenger].values.each do |item|
          p item
        end
      end

    	def flight_number
    		params[:flight][:flight_id]
      end

      def no_of_pax
        params[:people].to_i
      end

  

end
