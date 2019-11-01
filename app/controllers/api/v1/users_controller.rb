class Api::V1::UsersController < ApplicationController

  def index
    render json: User.daily_water
  end

end
