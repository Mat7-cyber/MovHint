class UsersController < ApplicationController


  def index
    @user = current.user
    # The `geocoded` scope filters only flats with coordinates
  end


  def update
    current_user.photo.purge
    current_user.update(photo: params[:user][:photo])
    redirect_to dashboard_path
  end

  def destroy
    sign_out current_user
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

end
