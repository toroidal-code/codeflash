require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  setup do
    @profile = profiles(:one)
  end

  test 'should not be valid about_me too long' do
    profile = Profile.new({name: @profile.name , about_me:"x"*751, github:@profile.github})
    assert !profile.valid?
  end

  test 'should be valid' do
    profile = Profile.new({name: @profile.name , about_me:@profile.about_me, github:@profile.github})
    assert profile.valid?
  end

  test 'get profile points' do
    @profile.comments << comments(:one) << comments(:two)
    solutions(:one).achievements  << achievements(:one)
    solutions(:two).achievements  << achievements(:two)
    solutions(:one).save
    solutions(:two).save
    @profile.solutions << solutions(:one) << solutions(:two)
    @profile.save

    assert_equal 85, @profile.points

  end
end
