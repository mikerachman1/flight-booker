class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] } 
    @available_flights = Flight.where(from_airport_id: params[:from_airport_id], 
                                      to_airport_id: params[:to_airport_id], 
                                      scheduled_on: params[:scheduled_on])
  end



  private

  def flight_params
    params.require(:flight).permit(:from_airport_id, :to_airport_id, :duration, :scheduled_on, :depart_time)
  end
end
