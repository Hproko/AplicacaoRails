require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    login
  end
    
  test "should get principal" do
    get home_principal_path
    assert_response :success
  end
end
