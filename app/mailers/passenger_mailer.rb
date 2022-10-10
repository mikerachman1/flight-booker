class PassengerMailer < ApplicationMailer
  def confirmation_email
    @booking = Booking.find(params[:booking_id])
    
    mail(to: @booking.passengers.pluck(:email),
          subject: "Flight Booking Confrimation")
  end
end
