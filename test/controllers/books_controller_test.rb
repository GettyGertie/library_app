require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookup_url
    assert_response :success
  end
end
