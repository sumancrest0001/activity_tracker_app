class MainActivitiesController < ApplicationController
  def index
    @mainactivity = @current_user.main_activities.all
    render json: { status: 'It is working without any error.', data: @mainactivity }
  end
  def create
    if @current_user
      mainactivity = @current_user.main_activities.create!(main_activity_params)
      task = mainactivity.tasks.create!(task_params)
      if mainactivity && task
        render json: {
          mainactivity: mainactivity,
          task: task,
          status: :created
        }
      else
        render json: {
          status: :bad_request,
          message: 'Activity is not created',
          mainactivity: mainactivity.errors
        }
      end
    else
      render json: {
        status: :unprocessable_entity,
        message: 'You are not logged In',
        mainactivity: mainactivity.errors
      }
    end
  end

  private

  def main_activity_params
    params.require(:data).permit(:title, :recorded)
  end

  def task_params
    params.require(:data).permit(:sleep, :work, :cook, :exercise, :watch, :read)
  end
end
