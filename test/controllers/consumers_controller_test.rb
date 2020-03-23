require 'test_helper'

class ConsumersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get consumers_new_url
    assert_response :success
  end
end
