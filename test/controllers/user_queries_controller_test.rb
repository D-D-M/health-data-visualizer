require 'test_helper'

class UserQueriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_queries_new_url
    assert_response :success
  end

  test "should get show" do
    get user_queries_show_url
    assert_response :success
  end

  test "should get create" do
    get user_queries_create_url
    assert_response :success
  end

end
