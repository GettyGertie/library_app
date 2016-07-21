require 'test_helper'

class UserTest < ActiveSupport::TestCase
def setup
  @user = User.new(name: "Example" ,
                   email: "example@email.com",
                  password: "foobar",
                  password_confirmation: "foobar")
end

test "user should be valid" do
  #should be assert and not assert_not below
  assert @user.valid?
end

test "name should be present" do
  @user.name = "  "
  assert_not @user.valid?
end

test "name should not be too long" do
  @user.name = "it" * 200
  assert_not @user.valid?
end

test "email should be present" do
  @user.email = " "
  assert_not @user.valid?
end


test "email should not be too long" do
  @user.email = "email"* 200 
  assert_not @user.valid?
 end

test "should accept valid email adresses" do
valid_email = %w[example@gmail.com EXAMPLE@gmail.com 
ex_am_ple@gmail.com exa+mple@gmail.com EXAMPLE@GMAIL.COM]
valid_email.each do |valid_emails|
  @user.email = valid_emails
  assert @user.valid?
end
end


test "should reject invalid email adresses" do
 invalid_email = %w[user@example,com user_at_foo.org user.name@example.
  foo@bar_baz.com foo@bar+baz.com]
  invalid_email.each do |invalid_emails|
  @user.email = invalid_emails
  assert_not @user.valid?
end
end

test "email should be unique" do
  dup_user = @user.dup
  dup_user.email = @user.email.upcase
  @user.save!
  assert_not dup_user.valid?
end
  # test "password should have a minimum length" do
  # @user.password = @user.password_confirmation = "a" * 17
  # assert_not @user.valid?
# end
test "authenticated? should return false for a user with nil digest" do
  assert_not @user.authenticated?(:remember, '')
end
  end
