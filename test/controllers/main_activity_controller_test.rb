require 'test_helper'

class MainActivityControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get main_activity_index_url
    assert_response :success
  end
end
