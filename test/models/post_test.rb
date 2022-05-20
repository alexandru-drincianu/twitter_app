require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:mike)
    @post = @user.posts.new(title: "First", description: "Second")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user_id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end

  test "description should be present" do
    @post.description = "     "
    assert_not @post.valid?
  end

  test "description should be at most 120 characters" do
    @post.description = "a" * 130
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end
end
