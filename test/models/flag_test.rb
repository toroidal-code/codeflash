require 'test_helper'

class FlagTest < ActiveSupport::TestCase
  setup do
    @flag = flags(:one)
  end

  test 'should not be valid missing reason' do
    flag = Flag.new(explanation:@flag.explanation)
    assert !flag.valid?
  end

  test 'should not be valid missing explanation' do
    flag = Flag.new(reason:@flag.reason)
    assert !flag.valid?
  end

  test 'should not be valid explanation too long' do
    flag = Flag.new(reason:@flag.reason, explanation:'f'*751)
    assert !flag.valid?
  end

  test 'should not be valid reason not in list' do
    flag = Flag.new(reason:'Strinnnng', explanation:'f'*751)
    assert !flag.valid?
  end

  test 'should  be valid' do
    flag = Flag.new(reason:@flag.reason, explanation:@flag.explanation)
    assert flag.valid?
  end
end
