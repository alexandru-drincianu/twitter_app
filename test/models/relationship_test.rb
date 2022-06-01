require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  
  def setup
    @relationship = Relationship.new(
      follower_id: users(:mike).id, followed_id: users(:andrei).id
    )
  end

  test 'should be valid' do
    assert @relationship.valid?
  end

  test "should require a follower" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a followed" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end

end
