class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    # @trips = Trip.all
    redirect_to root_url
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    unless @trip.user == current_user
      redirect_to root_url
    end
  end

  # GET /trips/new
  def new
    if logged_in?
      @trip = Trip.new # this was original - the method was added
    else
      redirect_to root_url, :flash => { :error => "Make sure you're logged in!!" }
    end
  end

  # GET /trips/1/edit
  def edit
    if !logged_in?
      redirect_to root_path, :flash => { :error => "Make sure you're logged in!" }
    elsif !question_author?
      redirect_to root_url, :flash => { :error => "You can't edit someone else's trip!" }
    end
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    if (logged_in? && trip_author?) 
      @trip.destroy
      redirect_to root_url
    else
      redirect_to root_url, :flash => { :error => "You can't delete someone else's trip!" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:trip_name, :location, :user_id, :to_pack, :to_do, :budget)
    end

    def trip_author?
      @trip.user == current_user
    end
end
