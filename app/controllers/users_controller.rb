class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index

    @users = search

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
    # If you start by search bar, only filter by locatiom
    # If you start in start journey, filter by location and services!

    # Needed!!!
    @search = Service.new
    @clothings = Service.clothings
    @repairs = Service.repairs
    @materials = Service.materials

    if params[:query].present?
      users = User.near(params[:query], 10)
    else
      # @users = User.all.where(seamstress: true)
      @services = Service.where(clothing: params[:clothings], repair: params[:repairs], material: params[:materials] )
      ids = @services.pluck(:seamstress_id).uniq
      users = User.where(id: ids)
    end
    
    return users


    
  end
end
