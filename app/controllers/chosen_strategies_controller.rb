class ChosenStrategiesController < ApplicationController
  def create
    @chosen_strategy = ChosenStrategy.new(chosen_strategy_params)
    @chosen_strategy.profile = current_user.profile
    @profile = current_user.profile
    if @chosen_strategy.save
      redirect_to main_profile_path
    else
      render :new
    end
  end

  def update
    @chosen_strategy = ChosenStrategy.find(params[:id])
    @profile = current_user.profile
    if @chosen_strategy.update(chosen_strategy_params)
      redirect_to main_profile_path
    else
      render :new
    end
  end


  private

  def chosen_strategy_params
    params.require(:chosen_strategy).permit(:personal_strategic_goal, :strategy_id)
  end
end
