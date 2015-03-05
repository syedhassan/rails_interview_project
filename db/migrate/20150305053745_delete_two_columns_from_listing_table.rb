class DeleteTwoColumnsFromListingTable < ActiveRecord::Migration
  def up
    remove_column :listings, :location_name
    remove_column :listings, :address
  end

  def down
    add_column :listings, :location_name, :string
    add_column :listings, :address, :string
    Location.find_each do |loc|
      listing = Listing.find_by_id(loc.location_id)
      listing.location_name = loc.name
      listing.address = loc.address
      listing.save!
    end
  end
end
