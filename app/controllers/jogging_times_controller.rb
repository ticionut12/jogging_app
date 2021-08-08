class JoggingTimesController < ApplicationController
  before_action :set_jogging_time, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, except: [:index, :show]

  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /jogging_times or /jogging_times.json
  def index
    @jogging_times = JoggingTime.all
  end

  # GET /jogging_times/1 or /jogging_times/1.json
  def show
  end


  # GET /jogging_times/new
  def new
    #@jogging_time = JoggingTime.new
    @jogging_time = current_user.jogging_times.build
  end

  # GET /jogging_times/1/edit
  def edit
  end

  # POST /jogging_times or /jogging_times.json
  def create
    #@jogging_time = JoggingTime.new(jogging_time_params)
    @jogging_time = current_user.jogging_times.build(jogging_time_params)

    respond_to do |format|
      if @jogging_time.save
        format.html { redirect_to @jogging_time, notice: "Jogging time was successfully created." }
        format.json { render :show, status: :created, location: @jogging_time }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jogging_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jogging_times/1 or /jogging_times/1.json
  def update
    respond_to do |format|
      if @jogging_time.update(jogging_time_params)
        format.html { redirect_to @jogging_time, notice: "Jogging time was successfully updated." }
        format.json { render :show, status: :ok, location: @jogging_time }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jogging_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jogging_times/1 or /jogging_times/1.json
  def destroy
    @jogging_time.destroy
    respond_to do |format|
      format.html { redirect_to jogging_times_url, notice: "Jogging time was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

    def correct_user
      @jogging_time = current_user.jogging_times.find_by(id: params[:id])
      redirect_to jogging_times_path, notice:" Not authorize to add jogging times" if @jogging_time.nil?
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jogging_time
      @jogging_time = JoggingTime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jogging_time_params
      params.require(:jogging_time).permit(:date, :distance, :total_time, :user_id)
    end
end
