class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_profile_present

  def check_profile_present
    return unless current_user && params[:controller] != "profiles"
    redirect_to main_profile_path if current_user.profile.nil?
  end
end
