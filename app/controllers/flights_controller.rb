class FlightsController < ApplicationController
  def index
  	@dates = Flight.unique_formatted.map { |date| [ date, date ] }
  	@airports = Airport.names_ordered.map{ |ap| [ "#{ap.name} #{ap.code}", ap.id ] }
   	@people = (1..4).map {|n| Array.new([n,n]) } #array to populate persons drop down
    if params[:origin_id]
   		@flights = Flight.find_flights(params[:date],
   										  params[:origin_id], params[:destination_id])
      #debugger

   	end
  end
 
end
