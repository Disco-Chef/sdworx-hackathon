class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @profile = current_user.profile || Profile.new
    @chosen_vision = current_user.profile&.chosen_vision || ChosenVision.new
    @new_chosen_strategy = ChosenStrategy.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to main_profile_path
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to main_profile_path
    else
      render :new
    end
  end

  def fetch_nickname
    name = Faker::Superhero.name
    render json: {name: name }
  end

  def fetch_origin_story
    story = Profile.get_random_story(params[:nickname])
    render json: {story: story }
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :secret_bio, :photo)
  end
end
