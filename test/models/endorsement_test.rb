require 'test_helper'

class EndorsementTest < ActiveSupport::TestCase
  test "idea must be present for endorsement" do
    endorsement = endorsements(:no_idea_endorsement)
    assert_not endorsement.valid?
  end

  test "user must be present for endorsement" do
    endorsement = endorsements(:no_user_endorsement)
    assert_not endorsement.valid?
  end
end
