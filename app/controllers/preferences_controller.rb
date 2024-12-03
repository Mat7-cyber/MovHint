class PreferencesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  def create
    Preference.create(movie_id: params[:movie_id].to_i, user: current_user)
  end

  def destroy
    Preference.where(movie_id: params[:movie_id].to_i, user: current_user).destroy
  end

end
