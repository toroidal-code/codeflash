require 'test_helper'
class ATest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: "lol@lol.lol",
                    username: "LOLOLOLOLOL",
                    password: "LOLlol101")
    @user.profile.solutions << solutions(:one)
    @ability = Ability.new(@user)
  end

  test 'should not be able to update profile that is not theirs' do
    assert @ability.cannot?(:update, Profile.new)
    assert @ability.can?(:update, @user.profile)
  end

  test 'should be able to create profile' do
    assert @ability.can?(:create, Profile)
  end

  test 'should be able to create solution' do
    assert @ability.can?(:create, Solution)
  end

  test 'should be able to create comment' do
    assert @ability.can?(:create, Comment)
  end

  test 'should be able to create flag' do
    assert @ability.can?(:create, Flag)
  end

  test 'should be able to create upvote/downvote Solution' do
    assert @ability.can?(:upvote, Solution)
    assert @ability.can?(:downvote, Solution)
  end

  test 'should be able to create upvote/downvote Comment' do
    assert @ability.can?(:upvote, Comment)
    assert @ability.can?(:downvote, Comment)
  end

  test 'should not be able to destroy solution that is not theirs' do
    assert @ability.cannot?(:destroy, Solution.new)
    assert @ability.can?(:destroy, solutions(:one))
  end

  test 'should not be able to update solution that is not theirs' do
    assert @ability.cannot?(:update, Solution.new)
    assert @ability.can?(:update, solutions(:one))
  end

  test 'should not be able to edit solution that is not theirs' do
    assert @ability.cannot?(:edit, Solution.new)
    assert @ability.can?(:edit, solutions(:one))
  end

  test 'should be able to read Achievement' do
    ability = Ability.new(nil)
    assert @ability.can?(:read, Achievement)
    assert ability.can?(:read, Achievement)
  end

  test 'should be able to read Category' do
    ability = Ability.new(nil)
    assert @ability.can?(:read, Category)
    assert ability.can?(:read, Category)
  end

  test 'should be able to read Comment' do
    ability = Ability.new(nil)
    assert @ability.can?(:read, Comment)
    assert ability.can?(:read, Comment)
  end

  test 'should be able to read Language' do
    ability = Ability.new(nil)
    assert @ability.can?(:read, Language)
    assert ability.can?(:read, Language)
  end

  test 'should be able to read Problem' do
    ability = Ability.new(nil)
    assert @ability.can?(:read, Problem)
    assert ability.can?(:read, Problem)
  end

  test 'should be able to read Profile' do
    ability = Ability.new(nil)
    assert @ability.can?(:read, Profile)
    assert ability.can?(:read, Profile)
  end

  test 'should be able to read Solution' do
    ability = Ability.new(nil)
    assert @ability.can?(:read, Solution)
    assert ability.can?(:read, Solution)
  end

  test 'should be able to read User' do
    ability = Ability.new(nil)
    assert @ability.can?(:read, User)
    assert ability.can?(:read, User)
  end

  test 'should be able to manage Achievement' do
    @user.admin = true
    ability = Ability.new(@user)
    assert ability.can?(:manage, Achievement)
  end

  test 'should be able to manage Category' do
    @user.admin = true
    ability = Ability.new(@user)
    assert ability.can?(:manage, Category)
  end

  test 'should be able to manage Comment' do
    @user.admin = true
    ability = Ability.new(@user)
    assert ability.can?(:manage, Comment)
  end

  test 'should be able to manage Language' do
    @user.admin = true
    ability = Ability.new(@user)
    assert ability.can?(:manage, Language)
  end

  test 'should be able to manage Problem' do
    @user.admin = true
    ability = Ability.new(@user)
    assert ability.can?(:manage, Problem)
  end

  test 'should be able to manage Profile' do
    @user.admin = true
    ability = Ability.new(@user)
    assert ability.can?(:manage, Profile)
  end

  test 'should be able to manage Solution' do
    @user.admin = true
    ability = Ability.new(@user)
    assert ability.can?(:manage, Solution)
  end

  test 'should be able to manage User' do
    @user.admin = true
    ability = Ability.new(@user)
    assert ability.can?(:manage, User)
  end
end