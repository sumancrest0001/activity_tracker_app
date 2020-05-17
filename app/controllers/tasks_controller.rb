class TasksController < ApplicationController
  def index
    @mainactivity = MainActivity.find(params[:id])
    @task = @mainactivity.task
    render json: {
      status: :ok,
      task: @task
    }
  end
end
