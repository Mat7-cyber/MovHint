class UsersController < ApplicationController


  def index
    @user = current.user
    # The `geocoded` scope filters only flats with coordinates
  end


  def update
  end


end
