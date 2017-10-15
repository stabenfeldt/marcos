class BikePartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @bike_part = BikePart.find(params[:id])
  end
end
