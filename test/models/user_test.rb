require 'test_helper'

class UserTest < ActiveSupport::TestCase
def setup
  @user = User.new(name: "Example" , email: "example@email.com")
end

test "user should be valid" do
  #should be assert and not assert_not below
  assert_not @user.valid?
end

test "name should be present" do
  @user.name = "  "
  assert_not @user.valid?
end

test "name should not be too long" do
  @user.name = "tetereenterreennn"
  assert_not @user.valid?
end

# test "email should be present" do
#   @user.email = " "
#   assert_not @user.valid?
# end

# test "email should not be too long" do
#   @user.email = "email"* 99 
#   assert_not @user.valid?
#  end
  test "password should have a minimum length" do
  @user.password = @user.password_confirm = "a" * 5
  assert_not @user.valid?
  end
end
