class QuestsController < ApplicationController
  def create
    @quest = Quest.new(params_quest)
    @quest.profile = current_user.profile
    if @quest.save!
      flash[:success] = "Quest successfully created"
      redirect_to adventure_path
    else
      flash[:error] = "Something went wrong"
      @new_bad_guy = BadGuy.new
      @new_power_up = PowerUp.new
      @new_quest = @quest
      render adventure_path
    end
  end

 def update
   @quest = Quest.find(params[:id])
   @profile = current_user.profile
     if @quest.update_attributes(params_quest)
       flash[:success] = "Quest was successfully updated"
       redirect_to adventure_path
     else
       flash[:error] = "Something went wrong"
       render :new
     end
 end

private

  def params_quest
    params.require(:quest).permit(:name,:profile_id,:xp,:description, quest_strategies_attributes: [:chosen_strategy_id])
  end
end