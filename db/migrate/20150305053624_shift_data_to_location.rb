class ShiftDataToLocation < ActiveRecord::Migration
  def up
    Listing.find_each do |listing|
      Location.find_or_create_by(
          :name => listing.location_name,
          :address => listing.address,
          :location_id => listing.id
      )
    end
  end

  def down
    Location.delete_all
  end

end
