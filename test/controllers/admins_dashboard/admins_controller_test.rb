require 'test_helper'

class AdminsDashboard::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_dashboard_admins_index_url
    assert_response :success
  end

end
