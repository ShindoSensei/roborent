class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :postcode
      t.integer :price
      t.belongs_to :user, foreign_key: true
      t.integer :lease_durn
      t.text :description
      t.string :property_type
      t.string :rent_area
      t.string :photo_url
      #to capture amenities data here?
      t.timestamps
    end
  end
end
