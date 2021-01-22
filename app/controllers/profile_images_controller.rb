class ProfileImagesController < ApplicationController

  def new
    @profile_image = ProfileImage.new
  end

  def create
    @profile = Profile.new(profile_image_params)
    @profile.user_id = current_user.id
    @profile.save
    redirect_to user_path(current_user.id)
  end

end
