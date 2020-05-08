class MainActivitiesController < ApplicationController
  include CurrentUserConcern
  def index
    @mainactivities = @current_user.main_activities.where('recorded >= ?', 1.week.ago.to_date).order('recorded DESC')
    ids = @mainactivities.pluck(:id)
    tasks = Task.where(main_activity_id: ids)
    render json: {
      status: 'SUCCESS',
      data: {
        mainactivities: @mainactivities,
        tasks: tasks
      }
    }
  end

  def create
    if @current_user
      mainactivity = @current_user.main_activities.create!(main_activity_params)
      @task = mainactivity.create_task!(task_params)
      if mainactivity && @task
        render json: {
          mainactivity: mainactivity,
          task: @task,
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

  def past_activities
    dates = [
      Date.today,
      Date.today - 1.day,
      Date.today - 1.week,
      Date.today - 1.month
    ]

    main_activities = MainActivity.where('DATE(created_at) IN (?)', dates)
    main_activities_ids = main_activities.pluck(:id)
    tasks = Task.where(main_activity_id: main_activities_ids)

    render json: {
      status: 'success',
      mainactivities: main_activities,
      tasks: tasks
    }
  end

  private

  def main_activity_params
    params.require(:data).permit(:title, :recorded)
  end

  def task_params
    params.require(:data).permit(:sleep, :work, :cook, :exercise, :watch, :read)
  end
end
