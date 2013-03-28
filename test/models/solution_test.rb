require 'test_helper'

class SolutionTest < ActiveSupport::TestCase

  setup do
    @solution = solutions(:one)
  end

  test 'should not save no code' do
    solution = Solution.new()
    assert !solution.valid?
  end

  test 'should not be valid upvotes not integer' do
    solution = Solution.new({code:@solution.code, up_votes:"string"})
    assert !solution.valid?
  end

  test 'should not be valid downvotes not integer' do
    solution = Solution.new({code:@solution.code, down_votes:"string"})
    assert !solution.valid?
  end

  test 'should be valid' do
    solution = Solution.new({code:@solution.code, up_votes:4, down_votes:5})
    assert solution.valid?
  end

  test 'get votes' do
    assert_equal 1, @solution.votes
  end
end
