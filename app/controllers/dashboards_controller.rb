class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :preferences]

  def show
    @user = current_user
  end

  def preferences
    @movies = current_user.prefered_movies


      preferences = Preference.all

      @original_titles = preferences.map { |preference| preference.movie.original_title }
 
  end

end
