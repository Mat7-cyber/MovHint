class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end

  def preferences
    @movies = Movie.all
  end

end
