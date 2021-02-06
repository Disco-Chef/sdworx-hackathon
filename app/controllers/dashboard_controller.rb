class DashboardController < ApplicationController
  def index
    @current_quests = current_user.profile.current_quests
    @completed_quests = current_user.profile.completed_quests

    @power_ups = current_user.profile.power_ups
    @bad_guys = current_user.profile.bad_guys

    @teams = current_user.teams
    # @allies = current_user.allies
    @chosen_strategies = current_user.profile.chosen_strategies
  end

  def defeat_bad_guy
    bad_guy = BadGuy.find(params[:id])
    bad_guy.total_xp += bad_guy.xp
    bad_guy.save!
    redirect_to dashboard_index_path
  end

  def increase_power_up
    power_up = PowerUp.find(params[:id])
    power_up.total_xp += power_up.xp
    power_up.save!
    redirect_to dashboard_index_path
  end

  def change_completion_rate
    @quest = Quest.find(params["quest"]["id"])
    @quest.completion_rate = params["quest"]["completion_rate"].to_i
    @quest.completed = true if @quest.completion_rate == 100
    @quest.save!
    flash[:notice] = "Updated !"
    redirect_to dashboard_index_path(anchor: "quest-#{@quest.id}")
  end
end
