require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  def setup
    @user = users(:example)
  endi

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name: "",
    email: "foo@invalid",
    password:
    "foo",
    password_confirmation: "bar" }i
  end
end
