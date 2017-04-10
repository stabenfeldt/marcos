class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_bike_part, only: [:new, :create]


  # GET /services
  # GET /services.json
  def index
    @services = Service.all.in_progress.order(:due_date)
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

  def find_user
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    @service.bike = @bike
    @service.bike_parts = @bike_parts

    respond_to do |format|
      if @service.save!
        $mixpanel.track('Admin', 'Registered a service')
        format.html { redirect_to [@bike.user, @bike],
                      notice: 'Service was successfully created.' }
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
        completed = params[:service][:completed] ? true : false

        if completed
          @service.update_attribute(:completed, completed)
          $mixpanel.track('Admin', 'Service completed') if completed

          @bike_parts.each { |bp|
            bp.update_attribute(:service_done_at_bike_distance, @bike.distance)
          }
        end

        notice = @service.completed? ? 'Service marked as complete'  : 'Updated'
        format.html { redirect_to services_path, notice: notice }
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

    def set_bike_part
      Rails.logger.debug "params is: #{params}"
      @bike_parts = BikePart.find(params[:bike_part_id])

      if @bike_parts.class == Array
        @bike = @bike_parts.first.bike
      else
        @bike = @bike_parts.bike
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.permit(:description, :log, :due_date, :bike_id,
                    :user_id, :completed, :bike_part_id)
      params.require(:bike_part_id)
    end
end
