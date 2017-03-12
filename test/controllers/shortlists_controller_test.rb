require 'test_helper'

class ShortlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shortlists_index_url
    assert_response :success
  end

end
