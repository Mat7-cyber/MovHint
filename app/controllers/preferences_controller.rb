class PreferencesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:toggle]



  
  def toggle
    if params[:method] == 'POST'
      Preference.create(movie_id: params[:movie_id].to_i, user: current_user)
    else
      Preference.find_by(movie_id: params[:movie_id].to_i, user: current_user).destroy
    end
  end


end
