require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  setup do
    @language = languages(:one)
  end

  test 'should not be valid missing name' do
    language = Language.new({ace_syntax:@language.ace_syntax, pygments_syntax:@language.pygments_syntax})
    assert !language.valid?
  end

  test 'should not be valid missing pygments_syntax' do
    language = Language.new({name: "Python", ace_syntax:@language.ace_syntax})
    assert !language.valid?
  end

  test 'should not be valid missing ace_syntax' do
    language = Language.new({name: "Python", pygments_syntax:@language.pygments_syntax})
    assert !language.valid?
  end

  test 'should not be valid name not unique' do
    language = Language.new({name: @language.name, ace_syntax:@language.ace_syntax, pygments_syntax:@language.pygments_syntax})
    assert !language.valid?
  end

  test 'should be valid' do
    language = Language.new({name: "Python", ace_syntax:@language.ace_syntax, pygments_syntax:@language.pygments_syntax})
    assert language.valid?
  end
end
