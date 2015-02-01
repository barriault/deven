class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.order(title: :asc).page params[:page]
  end
  
  def show
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      redirect_to @activity, notice: 'Activity was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: 'Activity was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_url, notice: 'Activity was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :chronic_start_date, :chronic_end_date, :activity_type, :contact_hours, 
        :co_provided, :received_support, :commercial_support, :scholarship_currency)
    end
end
