class BikePartsController < ApplicationController
  def show
    @bike_part = BikePart.find(params[:id])
  end
end
