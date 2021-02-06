class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def adventure
    @new_bad_guy = BadGuy.new
    @new_power_up = PowerUp.new
    @new_quest = Quest.new
  end
end
