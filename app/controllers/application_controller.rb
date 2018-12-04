class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # include Pundit

  # before_action :authenticate_user!
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
