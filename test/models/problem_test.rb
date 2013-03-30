require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  setup do
    @problem = problems(:one)
  end

  test 'should not be valid missing name' do
    problem = Problem.new(description: @problem.description,
                          points: @problem.points,
                          shortname: "myshortname9")
    assert !problem.valid?
  end

  test 'should not be valid missing description' do
    problem = Problem.new(name: @problem.name,
                          points: @problem.points,
                          shortname: "myshortname9")
    assert !problem.valid?
  end

  test 'should not be valid missing points' do
    problem = Problem.new(name: @problem.name,
                          description: @problem.description,
                          shortname: "myshortname9")
    assert !problem.valid?
  end

  test 'should not be valid missing shortname' do
    problem = Problem.new(name: @problem.name,
                          description: @problem.description,
                          points: @problem.points)
    assert !problem.valid?
  end

  test 'should not be valid points not integer' do
    problem = Problem.new(name: @problem.name,
                          description: @problem.description,
                          points: 1.5,
                          shortname: "myshortname9")
    assert !problem.valid?
  end

  test 'should not be valid points less than zero' do
    problem = Problem.new(name: @problem.name,
                          description: @problem.description,
                          points: -1,
                          shortname: @problem.shortname)
    assert !problem.valid?
  end

  test 'should not be valid shortname not unique' do
    problem = Problem.new(name: @problem.name,
                          description: @problem.description,
                          points: @problem.points,
                          shortname: @problem.shortname)
    assert !problem.valid?
  end

  test 'should not be valid invalid shortname format' do
    problem = Problem.new(name: @problem.name,
                          description: @problem.description,
                          points: @problem.points,
                          shortname: "300[[]d")
    assert !problem.valid?
  end

  test 'should be valid' do
    problem = Problem.new(name: @problem.name,
                          description: @problem.description,
                          points: @problem.points,
                          shortname: "myshortname9")
    assert problem.valid?
  end
end
