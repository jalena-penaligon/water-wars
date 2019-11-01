class Api::V1::UsersController < ApplicationController

  def index
    render json: User.daily_water
  end

  def create
    User.find_or_create_by(email: params[:user][:email])
    render status: 201,
    json: User.daily_water
  end
end
