class MainActivitiesController < ApplicationController
  def index
    @current_user = current_user = User.find(session[:user_id]) if session[:user_id]
    @mainactivity = @current_user.main_activities.all
    render json: { status: 'SUCCESS', data: @mainactivity }
  end

  def create
    @current_user = User.find(session[:user_id]) if session[:user_id]
    if @current_user
      mainactivity = @current_user.main_activities.create!(main_activity_params)
      @task = mainactivity.create_task!(task_params)
      if mainactivity && task
        render json: {
          mainactivity: mainactivity,
          task: task,
          status: :created
        }
      else
        render json: {
          status: :bad_request,
          message: 'Activity is not created'

        }
      end
    else
      render json: {
        status: :unprocessable_entity,
        message: 'You are not logged In',
        user: @current_user
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
