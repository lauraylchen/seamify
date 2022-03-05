class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @seamstresses = []
    @seamstresses.push(User.where(first_name: "Yolanda").first)
    @seamstresses.push(User.where(first_name: "Giuseppe").first)
    @seamstresses.push(User.where(first_name: "Rey").first)
  end
end
