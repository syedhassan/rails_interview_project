class ShiftDataToSeller < ActiveRecord::Migration

  def up
    Listing.find_each do |listing|
      Seller.find_or_create_by(
          :name => listing.seller_name,
          :location_id => listing.id
      )
    end
  end

  def down
    Seller.delete_all
  end
end
