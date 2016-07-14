require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  require 'test_helper'

  def setup
    @user = users(:example)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name: "",
    email: "foo@invalid",
    password:
    "foo",
    password_confirmation: "bar" }
    assert_template 'users/edit'
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), user: { name: name,
    email: email,
    password:
    "",
    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
  end
end
