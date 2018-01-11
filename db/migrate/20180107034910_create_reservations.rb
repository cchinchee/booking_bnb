class CreateReservations < ActiveRecord::Migration[5.1]
  def change
  	create_table :reservations do |r|
  		r.date :start_date, null:false
  		r.date :end_date, null:false
  		r.integer :number_of_guests	
  		r.references :user, foreign_key: true, index: true
  		r.references :listing, foreign_key: true, index: true
  		r.timestamps null:false
  	end 
  end
end
