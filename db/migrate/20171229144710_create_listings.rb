class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :listing_name
    	t.text :description
    	t.string :property_type
    	t.integer :number_of_bedrooms
    	t.integer :number_of_beds
    	t.text :address
    	t.string :country
      t.integer :number_of_guests	
      t.references :user, foreign_key: true, index: true
      t.timestamps null:false
    end
  end
end
	