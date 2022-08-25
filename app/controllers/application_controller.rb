class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    resource.is_a?(User) ? users_dashboard_root_path : admins_dashboard_root_path
  end
end
