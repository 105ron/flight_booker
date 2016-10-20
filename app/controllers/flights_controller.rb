class FlightsController < ApplicationController
  def index
  	@dates = Flight.unique_formatted.map { |date| [ date, date ] }
  	@airports = Airport.names_ordered.map{ |ap| [ "#{ap.name} #{ap.code}", ap.id ] }
   	if params[:origin_id]
   		@flights = Flight.find_flights(params[:date],
   										  params[:origin_id], params[:destination_id])
   	end
  end



  private

  	def user_params
      params.permit(:origin_id, :destination_id, :date, :people)
    end
 
end
