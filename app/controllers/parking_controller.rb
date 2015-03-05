class ParkingController < ActionController::Base

  def availability
    response = {}

    min_parking_hours = (params[:end].to_time - params[:start].to_time)/3600
    garages = Listing.where("available > 0 AND active = 't' AND min_parking_hours <= ?", min_parking_hours)
    first_available_listing = garages.first #Show the first available

    unless first_available_listing.nil?
      response[:available] = {:listing_id => first_available_listing.id, :amount => first_available_listing.price_per_hour}
    end

    render :json => response, :status => 200
  end

  def book
    response = {}

    listing = Listing.find_by_id(params[:listing_id])
    if listing.present? and listing.available > 0
      booking = Booking.create(:customer_name => Faker::Name.name, :plate_number => Faker::Number.number(7),
                               :time_start => params[:start].to_time, :time_end => params[:end].to_time,
                               :listing_id => params[:listing_id])

      unless booking.id.nil?
        listing.decrease_availability
        response[:booking_id] = booking.id
      end
    end
    render :json => response, :status => 200
  end

end