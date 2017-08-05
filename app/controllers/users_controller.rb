class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :only_admins, except: [:show, :fetch_bikes_from_strava]

  #http_basic_authenticate_with name: "bike", password: "lover"

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def toggle_admin
    return unless admin?
    session[:admin_menu] = !session[:admin_menu]
    redirect_to :back
  end


  def search
    first,last = params[:q].split if params[:q].present?
    if params[:q]
       @users = User.where('first_name ILIKE ? AND last_name ILIKE ?',
                                "%#{first}%", "%#{last}%")
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @services_in_progress = @user.services.in_progress
    @service_history      = @user.services.completed
    @bikes                = @user.bikes
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fetch_bikes_from_strava
    current_user.fetch_bikes_from_strava
    redirect_to current_user, notice: "Bikes imported"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def only_admins
      redirect_to root_url, :flash => { notice: 'Only for admins' } \
        unless current_user.admin? || current_user == @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :mobile)
    end
end
