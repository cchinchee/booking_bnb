class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :listing_name
      t.string :country
      t.string :property_type
      t.integer :price
      t.timestamps
    end
  end
end
