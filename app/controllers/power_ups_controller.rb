class PowerUpsController < ApplicationController
  def create
    @power_up = PowerUp.new(params_power_up)
    @power_up.profile = current_user.profile
    @power_up.total_xp = 0
    @profile = current_user.profile
    if @power_up.save
      flash[:success] = "PowerUp successfully created"
      redirect_to adventure_path
    else
      flash[:error] = "Something went wrong"
      @new_bad_guy = BadGuy.new
      @new_power_up = @power_up
      @new_quest = Quest.new
      render "pages/adventure"
    end
  end

  def update
    @power_up = PowerUp.find(params[:id])
    @profile = current_user.profile
      if @power_up.update(params_power_up)
        flash[:success] = "PowerUp was successfully updated"
        redirect_to adventure_path(anchor: "#power_up_#{@power_up.id}")
      else
        flash[:error] = "Something went wrong"
        render :new
      end
  end

  private

  def params_power_up
    params.require(:power_up).permit(:name,:description,:xp, :profile_id)
  end
end
