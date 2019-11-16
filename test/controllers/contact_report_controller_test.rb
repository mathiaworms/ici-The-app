require 'test_helper'

class ContactReportControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_report_index_url
    assert_response :success
  end

end
