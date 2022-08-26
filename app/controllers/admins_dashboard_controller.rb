class AdminsDashboardController < ApplicationController
  layout 'admins_dashboard'

  before_action :authenticate_admin!

end
