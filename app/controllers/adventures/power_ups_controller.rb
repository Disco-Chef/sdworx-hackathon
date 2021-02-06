class Adventures:PowerUpsController < ApplicationController
  before_action :set_power_up, only: [:show,:edit,:update,:destroy]

  def show
  end

  def index
    @power_ups = PowerUp.all
  end

  def edit
  end

  def create
    @power_up = PowerUp.new(params_power_up)
    if @power_up.save
      flash[:success] = "PowerUp successfully created"
      redirect_to @power_up
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def new
    @power_up = PowerUp.new
  end

  def update
      if @power_up.update_attributes(params_power_up)
        flash[:success] = "PowerUp was successfully updated"
        redirect_to @power_up
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  


  def destroy
    if @power_up.destroy
      flash[:success] = 'PowerUp was successfully deleted.'
      redirect_to power_ups_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to power_ups_url
    end
  end

  
  
  
  
  


  private

  def set_power_up
    @power_up = PowerUp.find(params[:id])
  end

  def params_bad_guy
    params.require(:power_up).permit(:name,:description,:xp, :profile_id)
  end
end
