class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:flight])
    @passenger_count = params[:passenger_count].to_i
    @passenger_count.times { @booking.passengers.build }
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
