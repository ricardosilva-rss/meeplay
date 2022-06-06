class ProfilesController < ApplicationController
  before_action :set_profile, only: [ :show, :edit, :update, :destroy ]

  def show; end

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile

    if @profile.save!
      redirect_to profile_path(@profile), notice: 'profile was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: 'profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :date_of_birth, :description, :bgg_profile, :photo)
  end

  def set_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end
end
