require 'test_helper'

class RamensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ramens_index_url
    assert_response :success
  end

end
