class PrivateController < ApplicationController
  before_action :check_user

  private

  def check_user
    redirect_to session_path unless current_user.present?
  end
end
