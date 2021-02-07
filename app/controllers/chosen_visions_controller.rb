class ChosenVisionsController < ApplicationController

  def create
    @chosen_vision = ChosenVision.new(chosen_vision_params)
    @chosen_vision.profile = current_user.profile
    @chosen_vision.vision = current_user.company.vision
    @profile = current_user.profile
    if @chosen_vision.save
      redirect_to main_profile_path
    else
      profile = current_user.profile || Profile.new
      @chosen_vision = current_user.profile&.chosen_vision || ChosenVision.new
      render "profiles/new"
    end
  end

  def update
    @chosen_vision = ChosenVision.find(params[:id])
    @profile = current_user.profile

    if @chosen_vision.update(chosen_vision_params)
      redirect_to main_profile_path
    else
      @profile = current_user.profile || Profile.new
      @chosen_strategy = ChosenStrategy.new
      render "profiles/new"
    end
  end


  private


  def chosen_vision_params
    params.require(:chosen_vision).permit(:motto)
  end
end
