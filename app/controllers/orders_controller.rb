class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_order_by_order_id, only: [:payment_received]

  before_action :only_admins


  def only_admins
    unless signed_in?
      redirect_to root_url, notice:'Logg inn først'
    else
      redirect_to root_url, notice:'only admins' unless admin?
    end
  end

  http_basic_authenticate_with name: "bike", password: "lover"

  # GET /orders
  # GET /orders.json
  def index
    @payed      = Order.payed
    @not_payed  = Order.not_payed
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # Marks the order as payed and created a new customer.
  def payment_received
    first_name, last_name  = @order.name.split
    @order.update_attribute(:payment_received, true)
    @customer = Customer.find(phone: @order.phone)
    unless @customer
      @customer = Customer.new(
        first_name: first_name,
        last_name: last_name,
        email: @order.email,
        phone: @order.phone
      )
    end
    redirect_to orders_path, notice: 'Marked as payed and new customer created'
  end


  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order,
                      notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  # Updates the order and creates a new customer
  def payment_received

    first_name, last_name = @order.name.split

    @customer = Customer.find_or_create_by(
      mobile: @order.phone
    )

    if @customer.blank?
      @customer = Customer.create(
        first_name: first_name,
        last_name:  last_name,
        email: @order.email,
        mobile: @order.phone,
        bike: Bike.creat
      )
    end

    @bike = Bike.create(
      brand: @order.bike_brand,
      model: @order.bike_model
    )

    @customer.bikes << @bike
    if @customer.save
      redirect_to orders_path
    else
      flash[:warning] = "could not mark the order as payed: #{@order.errors.full_messages}"
      render :index
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_order_by_order_id
      @order = Order.find(params[:order_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :product_id, :phone, :email, :payment_received, :bike_brand, :bike_model, :description, :valid_through)
    end
end
