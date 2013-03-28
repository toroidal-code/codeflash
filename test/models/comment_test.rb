require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = comments(:one)
  end

  test 'should not be valid no body' do
    comment = Comment.new()
    assert !comment.valid?
  end

  test 'should not be valid too long body' do
    comment = Comment.new({body:"x"*501})
    assert !comment.valid?
  end

  test 'should not be valid upvotes not integer' do
    comment = Comment.new({body:"x"*501, up_votes:"string"})
    assert !comment.valid?
  end

  test 'should not be valid downvotes not integer' do
    comment = Comment.new({body:"x"*501, down_votes:"string"})
    assert !comment.valid?
  end

  test 'should be valid' do
    comment = Comment.new({body:@comment.body, up_votes:4, down_votes:5})
    assert comment.valid?
  end

  test 'get votes' do
    assert_equal 90, @comment.votes
  end
end
