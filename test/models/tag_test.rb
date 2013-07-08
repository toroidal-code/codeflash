require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = tags(:one)
  end

  test 'should not be valid name not unique' do
    tag = Tag.new(name: @tag.name)
    assert !tag.valid?
  end

  test 'should not be valid missing name' do
    tag = Tag.new()
    assert !tag.valid?
  end

  test 'should be valid' do
    tag = Tag.new(name: 'Smile')
    assert tag.valid?
  end
end
