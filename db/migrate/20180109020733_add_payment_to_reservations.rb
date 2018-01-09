class AddPaymentToReservations < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservations, :payment, :integer, default:0
  end
end
