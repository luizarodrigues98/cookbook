class UsersDashboardController < ApplicationController

  before_action :authenticate_user!
  layout 'users_dashboard'

end
