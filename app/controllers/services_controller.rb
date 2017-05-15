class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update,
                                     :destroy, :receipt_for_new_service]
  before_action :set_bike_part, only: [:new, :create, :new_with_parts_selected]
  before_action :set_bike_part_from_service, only: [:edit, :update]
  before_action :set_bike, only: [:new_with_parts_selected, :update]



  # This page shows the receipt the customer tapes to his bike before delivering it
  def registered
    set_service
  end

  def register_bike_in
    set_service
    @service.update(:delivered_to_service, true)
  end


  # GET /services
  # GET /services.json
  def index
    @services = Service.all.in_progress.delivered_to_service.order(:due_date)
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

  # This page displays information regarding the service the user has ordered.
  # The user should print this and bring it with his bike.
  def receipt_for_new_service

  end

  def new_with_parts_selected
    @parts = BikePart.find(params[:bike_part_id])
    @service = @bike.services.new
  end

  # POST /services
  # POST /services.json
  #
  # Creating a new service requires a bike and the parts that are involved.
  #
  def create
    @service = []
    year  = params["service"]["due_date(1i)"]
    day   = params["service"]["due_date(3i)"]
    month = params["service"]["due_date(2i)"]
    hour  = params["service"]["due_date(4i)"]
    min   = params["service"]["due_date(5i)"]
    due_date = DateTime.parse "#{year}.#{month}.#{day} #{hour}:#{min}"
    description = params["service_description"]

    # Create the Bike Service first
    @service = @bike.services.create(due_date: due_date)

    # Then one service for each part
    bike_parts = []
    bike_parts << BikePart.find(params[:bike_part_id])
    bike_parts.flatten!

    bike_parts.each_with_index do |bike_part, i|
      distance = @bike.distance
      @service.part_services.create!(description: description[i],
                                     bike_part: bike_part,
                                     service_completed_at_milage: distance)
    end

    respond_to do |format|
      if @service.save
        $mixpanel.track('Admin', 'Registered a service')
        format.html { redirect_to [@bike.user, @bike],
                      notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        Rails.logger.debug "SERVICES ==NOT== SAVED"
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
          $mixpanel.track('Admin', 'Service completed') if completed
          @service.complete!(params[:bike_part_id], params[:log])
        end

        notice = @service.completed? ? 'Service marked as complete' : 'Updated'
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
      format.html { redirect_to user_bike_url(@service.bike.user, @service.bike),
                    notice: 'Service was successfully destroyed.' }
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

    def set_bike_part_from_service
      @bike_parts = @service.bike_parts
    end

    def set_bike_part
      @bike_parts = []
      @bike_parts << BikePart.find(params[:bike_part_id])
      @bike_parts.flatten!
      @bike = @bike_parts.first.bike
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:description, :log, :due_date, :bike_id,
                    :user_id, :completed, bike_part_id: [])
    end
end
