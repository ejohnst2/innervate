require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "a team must have a Slack ID" do
    team = teams(:invalid_team)
    assert_not team.valid?
  end

  test "a team must have a team plan" do
    team = teams(:no_plan_team)
    assert_not team.valid?
  end
end
