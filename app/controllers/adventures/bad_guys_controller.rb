class Adventures:BadGuysController < ApplicationController
  before_action :set_bad_guy, only: [:show,:edit,:update,:destroy]
  
  def index
    @bad_guy = BadGuy.all
  end

  def show
  end

  def edit
  end
  
  
  def create
    @bad_guy = BadGuy.new(params_bad_guy)
    if @bad_guy.save
      flash[:success] = "BadGuy successfully created"
      redirect_to @bad_guy
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def new
    @bad_guy = BadGuy.new
  end
  
  def destroy
    if @bad_guy.destroy
      flash[:success] = 'BadGuy was successfully deleted.'
      redirect_to bad_guys_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to bad_guys_url
    end
  end
  
  def update
      if @bad_guy.update_attributes(params_bad_guy)
        flash[:success] = "BadGuy was successfully updated"
        redirect_to @bad_guy
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  private

  def set_bad_guy
    @bad_guy = BadGuy.find(params[:id])
  end

  def params_bad_guy
    params.require(:bad_guy).permit(:name,:story,:xp, :profile_id)
  end
  
end
