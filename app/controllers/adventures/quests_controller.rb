class Adventures:QuestsController < ApplicationController
  before_action :set_quest, only: [:show,:edit,:update,:destroy]
  def show
  end

  def index
    @quests = Quest.all
  end

  def new
    @quest = Quest.new
  end
  
  def

  def create
    @quest = Quest.new(params_quest)
    if @quest.save
      flash[:success] = "Quest successfuled"
      redirect_to @quest
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def update
      if @quest.update_attributes(params_quest)
        flash[:success] = "Object was successfully updated"
        redirect_to @quest
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def edit
  end

  def destroy
    if @quest.destroy
      flash[:success] = 'Quest was successfully deleted.'
      redirect_to quests_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to quests_url
    end
  end
  
  
  
    

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def params_quest
    params.require(:quest).permit(:name,:profile_id,:xp,:description, :completed,:completion_rate)
  end
end
