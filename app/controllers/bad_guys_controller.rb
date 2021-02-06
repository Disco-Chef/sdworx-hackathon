class BadGuysController < ApplicationController
  
  def create
    @bad_guy = Badguy.new(params_bad_guy)
    @bad_guy.profile = current_user.profile
    @profile = current_user.profile
    if @bad_guy.save
      flash[:success] = "Badguy successfully created"
      redirect_to adventure_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @bad_guy = BadGuy.find(params[:id])
    @profile = current_user.profile
      if @bad_guy.update_attributes(params_bad_guy)
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
