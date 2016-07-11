require 'test_helper'

class UserTest < ActiveSupport::TestCase
def setup
  @user = User.new(name: "Example" ,
                   email: "example@email.com")
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
  @user.name = "it" * 11
  assert_not @user.valid?
end

test "email should be present" do
  @user.email = " "
  assert_not @user.valid?
end


test "email should not be too long" do
  @user.email = "email"* 99 
  assert_not @user.valid?
 end

test "should accept valid email adresses" do
valid_email = %w[example@gmail.com EXAMPLE@gmail.com ex_am_ple@gmail.com exa+mple@gmail.com]
valid_email.each do |valid_emails|
  @user.email = valid_emails
  assert @user.valid?
end
end


test "email should be unique" do
  dup_user = @user.dup
  dup_user.email = @user.email.upcase
  assert_not dup_user.valid?
end
end
