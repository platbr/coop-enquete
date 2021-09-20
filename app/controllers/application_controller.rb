class ApplicationController < ActionController::Base
  layout 'cooperado'
  private
  def current_user
    @current_user ||= Usuario.where(id: session[:usuario_id]).take
  end
end
