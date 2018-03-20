require "test_helper"

class BattleTest < ActiveSupport::TestCase
  def setup
    @battle = battles :dog
  end

  test "link should be a valid imgur jpeg image" do
    valid_links = %w(
      https://imgur.com/YP8CxhH
      https://m.imgur.com/YP8CxhH
      http://imgur.com/YP8CxhH
      http://imgur.com/YP8CxhH.jpg
      http://m.imgur.com/YP8CxhH
      imgur.com/YP8CxhH
      m.imgur.com/YP8CxhH
      https://i.imgur.com/YP8CxhH.jpg
      http://i.imgur.com/YP8CxhH.jpg
      i.imgur.com/YP8CxhH.jpg
    )

    valid_links.each do |link|
      @battle.link = link
      assert @battle.valid?
    end

    invalid_links = %w(
      invalid link
      google.com
      imgur.com
      https://m.imgur.com/not_existed_image
      https://m.i.imgur.com/YP8CxhH.jpg
      http://m.i.imgur.com/YP8CxhH.jpg
      m.i.imgur.com/YP8CxhH.jpg
      https://imgur.com/TJ23B2e.jpg
      https://imgur.com/TJ23B2e
    )

    invalid_links.each do |link|
      @battle.link = link
      assert_not @battle.valid?
    end
  end
end
