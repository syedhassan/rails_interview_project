class Listing < ActiveRecord::Base
  has_many :bookings

  def decrease_availability
    update_attributes(:available => available - 1)
  end

end
