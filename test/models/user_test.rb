require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user must belong to a Slack team" do
    user = users(:bob)
    assert_not user.valid?
  end

  test "a user must have email, uid, first_name, and last_name" do
    user = users(:karina)
    assert_not user.valid?
  end
end
