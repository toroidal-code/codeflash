require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)
  end

  test 'should not be valid name not unique' do
    category = Category.new(name: @category.name)
    assert !category.valid?
  end

  test 'should not be valid missing name' do
    category = Category.new()
    assert !category.valid?
  end

  test 'should be valid' do
    category = Category.new(name: "Smile")
    assert category.valid?
  end
end
