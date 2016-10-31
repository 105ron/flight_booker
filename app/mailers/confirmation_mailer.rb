class ConfirmationMailer < ApplicationMailer
ActionMailer::Base.default :from => "Rails Airways <no-reply@railsairways.com>"


  def confirmation_email(passenger, booking)
    @passenger = passenger
    @booking = booking
    @flight = booking.flight
    mail(to: @passenger.email, subject: 'Thanks for booking with Rails Airways')
  end
end
