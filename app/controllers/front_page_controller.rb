class FrontPageController < ApplicationController
  layout "application"

  def index
    @products = Product.all
  end

  def contact_form
    @order = Order.create!(
      name: params[:name],
      product: params[:product],
      phone: params[:phone],
      email: params[:email],
      bike_brand: params[:bike_brand],
      bike_model: params[:bike_model],
    )
    Rails.logger.debug "Order created: #{@order.inspect}"
    flash[:info] = 'Takk for din bestilling!'
    redirect_to fp_url
  end

end

