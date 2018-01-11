class ReservationJob < ApplicationJob
  queue_as :default

  def perform(customer, email, listing_name, total_price, id, start_date, end_date, number_of_guests, payment)
    # Do something later

    UserMailer.confirmation_booking(customer, email, listing_name, total_price, id, start_date, end_date, number_of_guests, payment).deliver_now
  end
end
