class UsersController < ApplicationController
  def index
    @users = User.all.where(seamstress: true)

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

  def search
    @clothing = Service.clothing
    @repairs = Service.repairs
    @materials = Service.materials
  end

end
