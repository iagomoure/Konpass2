class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_404(params)
    Rails.logger.warn("Tried to access #{params} which did not exist.")
    render "layouts/404"
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end
end
