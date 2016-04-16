class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "Access denied. You are not authorized to access the requested page."
    redirect_to root_path
  end

  protected

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def load_permissions
    @current_permissions = current_user.role_permissions + current_user.permissions
    @current_permissions.uniq if @current_permissions.present?
  end
end
