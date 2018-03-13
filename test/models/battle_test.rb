require "test_helper"

class BattleTest < ActiveSupport::TestCase
  test "link should be a valid imgur jpeg image hash" do
    # valid image hash
    battle = battles :dog
    assert battle.valid?

    # invalid image hash
    battle.link = "_______"
    assert_not battle.valid?

    # gif image is invalid
    battle.link = "VqyDfwQ"
    assert_not battle.valid?
  end
end
