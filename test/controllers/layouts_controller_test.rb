require 'test_helper'

class LayoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", /Home/i
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", /Contact/i
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", /About/i
  end

end
