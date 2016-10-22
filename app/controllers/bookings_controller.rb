class BookingsController < ApplicationController
  def new
  	@flight = Flight.find_by(id: params[:flight][:flight_id])
  end
end
