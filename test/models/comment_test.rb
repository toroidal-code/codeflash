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
  test 'should be valid' do
    comment = Comment.new({body:@comment.body})
    assert comment.valid?
  end
end
