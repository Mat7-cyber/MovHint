class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def show
  end

  def preferences
    @movies = Movie.all
  end

  def index
    @user = current_user
  end


end
