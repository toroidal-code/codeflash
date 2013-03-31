require 'test_helper'

class FlagsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(email: "lol@lol.lol", username: "LOLOLOLOLOL", password: "LOLlol101", admin: true)
    @user.skip_confirmation!
    sign_in(@user)
    @flag = flags(:one)
    @problem = problems(:one)
    @solution = solutions(:one)
    @solution.flags << @flag
    @solution.save
    @problem.solutions << @solution
    @problem.save
  end

  test "should get index" do
    get :index, problem_id: @problem, solution_id: @solution
    assert_response :success
    assert_not_nil assigns(:flags)
  end

  test "should get new" do
    get :new, problem_id: @problem, solution_id: @solution
    assert_response :success
  end

  test "should create flag" do
    assert_difference('Flag.count') do
      post :create, flag: { explanation: @flag.explanation, profile_id: @flag.profile_id, reason: @flag.reason }, problem_id: @problem, solution_id: @solution
    end

    assert_redirected_to problem_solution_path(@problem, @solution)
  end

  test "should show flag" do
    get :show, id: @flag, problem_id: @problem, solution_id: @solution
    assert_response :success
  end

  test "should destroy flag" do
    assert_difference('Flag.count', -1) do
      delete :destroy, id: @flag, problem_id: @problem, solution_id: @solution
    end

    assert_redirected_to problem_solution_path(@problem, @solution)
  end
end
