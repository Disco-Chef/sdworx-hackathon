class BadGuysController < ApplicationController

  def create
    @bad_guy = BadGuy.new(params_bad_guy)
    @bad_guy.profile = current_user.profile
    @bad_guy.total_xp = 0
    @profile = current_user.profile
    if @bad_guy.save
      flash[:success] = "Badguy successfully created"
      redirect_to adventure_path
    else
      flash[:error] = "Something went wrong"
      @new_bad_guy = @bad_guy
      @new_power_up = PowerUp.new
      @new_quest = Quest.new
      render "pages/adventure"
    end
  end

  def update
    @bad_guy = BadGuy.find(params[:id])
    @profile = current_user.profile
      if @bad_guy.update(params_bad_guy)
        flash[:success] = "BadGuy was successfully updated"
        redirect_to adventure_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end


  private

  def params_bad_guy
    params.require(:bad_guy).permit(:name,:story,:xp, :profile_id)
  end

end
