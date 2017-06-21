class FrontPageController < ApplicationController
  layout "frontpage"

  def index
  end

  def order
    @products = Product.all
  end

  def service_booklet
  end

  def contact_form
    @order = Order.create!(
      name: params[:name],
      product_id: params[:product_id],
      phone: params[:phone],
      email: params[:email],
      bike_brand: params[:bike_brand],
      bike_model: params[:bike_model],
    )
    Rails.logger.debug "Order created: #{@order.inspect}"
    flash[:notice] = 'Takk for din bestilling!'
    redirect_to fp_url
  end

end

