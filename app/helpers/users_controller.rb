class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @updated_params = user_params.clone
    generate_playlist_format
    if @user.update(@updated_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :band_description, :photo, :youtube_playlist,
                                 :soundcloud_playlist)
          .delete_if { |_key, value| value.blank? }
  end

  def generate_playlist_format
    if user_params[:youtube_playlist] && @user.youtube_playlist != @updated_params[:youtube_playlist]
      @updated_params[:youtube_playlist] = @updated_params[:youtube_playlist].match(/(?<=list=).*/)[0]
    end
    if user_params[:soundcloud_playlist] && @user.soundcloud_playlist != @updated_params[:soundcloud_playlist]
      @updated_params[:soundcloud_playlist] = @updated_params[:soundcloud_playlist].match(/(?<=playlists\/).*(?=&color)/)[0]
    end
  end
end
