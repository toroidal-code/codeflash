require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  setup do
    @profile = profiles(:one)
  end

  test 'should not be valid about_me too long' do
    profile = Profile.new(name: @profile.name,
                          about_me:"x"*751,
                          github:@profile.github)
    assert !profile.valid?
  end

  test 'should be valid' do
    profile = Profile.new(name: @profile.name,
                          about_me:@profile.about_me,
                          github:@profile.github)
    assert profile.valid?
  end

  test 'get profile points' do
    s1 = solutions(:one)
    s2 = solutions(:two)
    s2.language = languages(:one)
    @profile.comments << comments(:one) << comments(:two)
    s1.achievements  << achievements(:one)
    s2.achievements  << achievements(:two)
    @profile.solutions << s1 << s2
    s1.save
    s2.save
    @profile.save

    assert_equal 85, @profile.points

  end
end
