require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new username: "Test", email: "test@local.com",
                     password: DEFAULT_TEST_PASSWORD,
                     password_confirmation: DEFAULT_TEST_PASSWORD
  end

  test "username should be case insensitive unique" do
    assert @user.valid?
    @user.username = "John"
    assert_not @user.valid?
  end

  test "username should contain letters, numbers and underscores only" do
    @user.username = "Test Username"
    assert_not @user.valid?
  end
end
