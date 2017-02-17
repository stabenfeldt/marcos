class FrontPageController < ApplicationController
  layout "frontpage"

  def index
  end

  def contact_form
    @name = params[:name]
    @comment = params[:comment]
    @product = params[:product]
    Rails.logger.debug "Will forward email from #{@name}"
    flash[:info] = 'Takk for din bestilling!'
    redirect_to fp_url
  end

end
