class DashboardsController < ApplicationController

  def show

  end

  def preferences
    @movies = Movie.all
  end


end
