class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index

    # Location search
    if params[:query].present?
      @users = User.near(params[:query], 10)
    else
      @users = User.all.where(seamstress: true)
    end

    # @users
    # raise
    @users = search
  
    # raise

    # @users = @users_Array
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
    # if params[:clothings] == nil || params[:clothing] == [] 
    #   @services = Service.all
    # else 
    #   @services = Service.where(clothing: params[:clothings])
    # end

    # if params[:repairs] == nil || params[:clothing] == [] 
    #   @services = Service.all
    # else
    #   @services = Service.where(repair: params[:repairs])
    # end

    # if params[:materials] == nil || params[:materials] == [] 
    #   @services = Service.all
    # else
    #   @services = Service.where(material: params[:materials])
    # end

    if params[:query] != nil
      @services = Service.where(params[:query])
    else
      @services = Service.all
    end
    
    test1 = @services.pluck(:seamstress_id).uniq
    test2 = User.where(id: test1)
    raise

    # raise

    # user_Array = []
    # @services.each do |service|
    #   user = User.find(service.seamstress.id)
    #   user_Array.push(user)
    # end

    # Search where users = id1 or id2 or id3
    # raise
    # return user_Array

  end
end
