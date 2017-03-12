class CreateJoinTableAmenitiesProperties < ActiveRecord::Migration[5.0]
  def change
    create_join_table :amenities, :properties
      # t.index [:amenity_id, :property_id]
      # t.index [:property_id, :amenity_id]
  end
end
