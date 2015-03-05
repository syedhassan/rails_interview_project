class AdminController < ActionController::Base

  def index
    @listings = Listing.all
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(params.require(:listing).permit(:available, :price_per_hour))
      redirect_to admin_index_path
    else
      render 'edit'
    end
  end

end