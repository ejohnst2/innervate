require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "user cannot log idea if it isn't at least 50 characters" do
    idea = ideas(:short_idea)
    assert_not idea.valid?
  end

  test "an idea must belong to a user" do
    idea = ideas(:invalid_idea)
    assert_not idea.valid?
  end
end
