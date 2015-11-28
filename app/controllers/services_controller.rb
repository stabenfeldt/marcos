class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_bike, only: [:new, :show, :create]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all.in_progress
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end


  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    @bike = @service.bike
  end

  def find_customer
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.bike = @bike

    respond_to do |format|
      if @service.save!
        format.html { redirect_to [@bike.customer, @bike], notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update!(service_params)
        notice = @service.completed? ? 'Service marked as complete'  : 'Updated'
        format.html { redirect_to @service.bike.customer, notice: notice }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    def set_bike
      @bike = Bike.find(params[:bike_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:description, :log, :due_date, :bike_id,
                                      :user_id, :completed)
    end
end
