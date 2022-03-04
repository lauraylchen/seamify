class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if params[:query].present?
      @users = User.near(params[:query], 10)
    else
      @users = User.all.where(seamstress: true)
    end

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url("yarn_marker.png")
      }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    # unless params[:clothings].nil?
    @search = Service.new
    @clothings = Service.clothings
    @repairs = Service.repairs
    @materials = Service.materials
    # end
  end
end
