class MainActivityController < ApplicationController
  def index
    render json: { status: 'It is working without any error.' }
  end
end
