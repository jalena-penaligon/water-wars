class Api::V1::WaterLogsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    user.water_logs.create(oz: params[:oz])
    render status: 201,
    json: User.daily_water
  end
end
