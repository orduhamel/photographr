require 'test_helper'

class PrestationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prestations_index_url
    assert_response :success
  end

end
