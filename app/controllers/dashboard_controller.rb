class DashboardController < ApplicationController

  def index
    @current_quests = current_user.profile.current_quests
    @completed_quests = current_user.profile.completed_quests

    @power_ups = current_user.profile.power_ups
    @bad_guys = current_user.profile.bad_guys

    @allies = current_user.allies
  end

  def update_xp
    # can use for both beating bad guy and acquiring power_up
    current_user.profile.total_xp += 1
    current_user.profile.save!
  end

end
