class ParkingController < ActionController::Base

  def availability
    render :json => {:available =>  {:listing_id => 1, :amount => 13}}, :status => 200
  end

  def book
    render :json => {:booking_id => 1}, :status => 200
  end

end