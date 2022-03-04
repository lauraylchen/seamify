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

    @search = Service.new
    @clothings = Service.clothings
    @repairs = Service.repairs
    @materials = Service.materials
  
    # If statements allow for search if user does not select anything!
    if params[:clothings] == nil || params[:clothing] == [] 
      @services = Service.all
    else
      @services = Service.where(clothing: params[:clothings])
    end

    if params[:repairs] == nil || params[:clothing] == [] 
      @services = Service.all
    else
      @services = Service.where(repair: params[:repairs])
    end

    if params[:materials] == nil || params[:materials] == [] 
      @services = Service.all
    else
      @services = Service.where(material: params[:materials])
    end
    # raise
    
    
  
  end
end
