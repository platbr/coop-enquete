class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  layout 'cooperado'
  private
  def current_user
    @current_user ||= Usuario.where(id: session[:usuario_id]).take
  end
end
