class DeleteSellerNameColumnFromListingTable < ActiveRecord::Migration

  def up
    remove_column :listings, :seller_name
  end

  def down
    add_column :listings, :seller_name, :string
    Seller.find_each do |sel|
      listing = Listing.find_by_id(sel.location_id)
      listing.seller_name = sel.name
      listing.save!
    end
  end
end
