require 'test_helper'
class AchievementTest < ActiveSupport::TestCase
  setup do
    @achievement = achievements(:one)
  end

  test 'should not be valid missing name' do
    achievement = Achievement.new(description: @achievement.description,
                                  points: @achievement.points)
    assert !achievement.valid?
  end

  test 'should not be valid missing description' do
    achievement = Achievement.new(name: @achievement.name,
                                  points: @achievement.points)
    assert !achievement.valid?
  end

  test 'should not be valid missing points' do
    achievement = Achievement.new(name: @achievement.name,
                                  description: @achievement.description)
    assert !achievement.valid?
  end

  test 'should not be valid points not integer' do
    achievement = Achievement.new(name: @achievement.name,
                                  description: @achievement.description,
                                  points: 1.5)
    assert !achievement.valid?
  end

  test 'should not be valid points less than 0' do
    achievement = Achievement.new(name: @achievement.name,
                                  description: @achievement.description,
                                  points: -1)
    assert !achievement.valid?
  end

  test 'should be valid' do
    achievement = Achievement.new(name: @achievement.name,
                                  description: @achievement.description,
                                  points: @achievement.points)
    assert achievement.valid?
  end
end
