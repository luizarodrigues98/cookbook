class AdminsDashboardController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins_dashboard'

end
