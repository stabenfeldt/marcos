class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  before_action :set_bike_from_id, only: [:parts, :add_part, :remove_part]
  before_action :set_user #, only: [:new, :create, :show]
  before_action :authenticate_user!

  before_action :only_admins, except: [:new, :create, :show, :edit, :update]

  def only_admins
    return if admin?
    return if @bike.user == current_user
    redirect_to root_url, alert: 'Only for admins'
  end

  # GET /bikes
  # GET /bikes.json
  def index
    @bikes = Bike.all
  end

  # GET /bikes/1
  # GET /bikes/1.json
  def show
    @service              = @bike.services.new
    service_registered_but_not_delivered
    #@services_in_progress = @bike.services.in_progress
    #@service_history      = @bike.services.completed
  end

  def parts
    @used_parts      = @bike.parts
    @available_parts = Part.all - @bike.parts
  end

  def add_part
    @part = Part.find params[:id]
    @bike.parts << @part
    @bike.save!
    head 200, content_type: "text/html"
  end

  def remove_part
    @bike.parts.delete Part.find(params[:id])
    @bike.save!
    head 200, content_type: "text/html"
  end

  # GET /bikes/new
  def new
    @bike = Bike.new
  end

  # GET /bikes/1/edit
  def edit
  end

  # POST /bikes
  # POST /bikes.json
  def create
    @bike = @user.bikes.new(bike_params)

    respond_to do |format|
      if @bike.save
        $mixpanel.track('Admin', 'Created a bike')
<<<<<<< HEAD
        format.html { redirect_to @bike,
                      notice: 'Bike was successfully created.' }
=======
        format.html { redirect_to @bike.user,
                      notice: 'Sykkel lagret!' }
>>>>>>> origin/div-fixes
        format.json { render :show, status: :created, location: @bike }
      else
        format.html { render :new }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bikes/1
  # PATCH/PUT /bikes/1.json
  def update
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to [@user, @bike],
                      notice: 'Sykkel oppdatert!' }
        format.json { render :show, status: :ok, location: @bike }
      else
        format.html { render :edit }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bikes/1
  # DELETE /bikes/1.json
  def destroy
    @bike.destroy
    respond_to do |format|
      format.html { redirect_to [@bike.user], notice: 'Sykkelen ble slettet' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike
      @bike = Bike.find(params[:id])
    end

    def set_bike_from_id
      @bike = Bike.find(params[:bike_id])
    end

    def set_user
      @user = current_user # User.find(params[:user_id])
    end


    # Never trust parameters from the scary internet, only allow the white
    # list through.
    def bike_params
      params.require(:bike).permit(:brand, :model, :year, :image, :name, :distance)
    end

    def service_registered_but_not_delivered
      return unless @service.delivered_to_service
      @service = current_user.services.in_progress.first
      msg = "Hei," \
            "<br/>" \
            "Print ut kvitteringen du finner på  "\
            "#{view_context.link_to('denne siden ',
              receipt_for_new_service_path(@bike) )}" \
            "og ta den med deg til verkstedet. "
      flash[:notice] = msg
    end
end
