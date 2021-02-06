class DashboardController < ApplicationController
  def index
    @current_quests = current_user.profile.current_quests
    @completed_quests = current_user.profile.completed_quests

    @power_ups = current_user.profile.power_ups
    @bad_guys = current_user.profile.bad_guys

    @teams = current_user.teams
    # @allies = current_user.allies
  end
end
