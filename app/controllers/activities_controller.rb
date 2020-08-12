class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show]
  
  def index
    @activities = Activity.all
  end
  
  def new
    @activity = Activity.new
  end
  
  def show
  end
  
  def create
    @activity = Activity.new(activity_params)
    if @activity.valid?
    @activity.save
    redirect_to activity_path(@activity)
    else
    flash[:my_errors] = @activity.errors.full_messages
    redirect_to new_activity_path
    end
  end
  
  private
    
  def find_activity
    @activity = Activity.find(params[:id])
  end
  
  def activity_params
    params.require(:activity).permit(:name, :difficulty)
  end
  
  
end
