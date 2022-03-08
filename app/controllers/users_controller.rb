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
        image_url: helpers.asset_url("needle-red.png")
      }
    end
  end

  def show
    @seamstress = User.find(params[:id])
    services = @seamstress.services
    @clothings = services.map(&:clothing)
    @repairs = services.map(&:repair)
    @materials = services.map(&:material)
    # Order Form
    @order = Order.new
    @order.order_items.build
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
        if params[:query] =~ /[0-9]+/
          users = User.near(params[:query], 2)
        else
          users = User.near(params[:query], 20)
        end
    else
      # Logic for search form!
      @services = Service.where(clothing: params[:clothing], repair: params[:repair], material: params[:material])
      ids = @services.pluck(:seamstress_id).uniq
      users = User.where(id: ids)
    end
    return users
  end
end
