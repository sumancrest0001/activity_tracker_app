class RegistrationsController < ApplicationController
  
  def create
    user = User.create!(
      name: params['user']['name'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
    )

    if user 
      session[:user_id] = user.id 
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user 
      }
    end
  end

  def logout
    reset_session
    render json: {status: 200, logged_out: true}
  end

end
