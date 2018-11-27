require 'test_helper'

class NotifiationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get notifiations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get notifiations_destroy_url
    assert_response :success
  end

end
