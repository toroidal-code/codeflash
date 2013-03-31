require 'test_helper'

class FlagsControllerTest < ActionController::TestCase
  setup do
    @user = User.create!(email: "lol@lol.lol", username: "LOLOLOLOLOL", password: "LOLlol101", admin: true)
    @user.skip_confirmation!
    sign_in(@user)
    @flag1 = flags(:one)
    @flag2 = flags(:two)
    @flag3 = flags(:three)
    @problem = problems(:one)
    @solution = solutions(:one)
    @comment1 = comments(:one)
    @comment2 = comments(:two)
    @comment1.flags << @flag1
    @comment2.flags << @flag2
    @solution.flags << @flag3
    @solution.comments << @comment1
    @solution.save
    @problem.solutions << @solution
    @problem.comments << @comment2
    @problem.save
  end

  test "should get problem solution index" do
    get :index, problem_id: @problem, solution_id: @solution
    assert_response :success
    assert_not_nil assigns(:flags)
  end

  test "should get problem comment index" do
    get :index, problem_id: @problem, comment_id: @comment1
    assert_response :success
    assert_not_nil assigns(:flags)
  end


  test "should get problem solution comment index" do
    get :index, problem_id: @problem, solution_id: @solution, comment_id: @comment2
    assert_response :success
    assert_not_nil assigns(:flags)
  end


  test "should get problem solution new" do
    get :new, problem_id: @problem, solution_id: @solution
    assert_response :success
  end

  test "should get problem solution comment new" do
    get :new, problem_id: @problem, solution_id: @solution, comment_id: @comment2
    assert_response :success
  end

  test "should get problem comment new" do
    get :new, problem_id: @problem, comment_id: @comment1
    assert_response :success
  end

  test "should create problem solution flag" do
    assert_difference('Flag.count') do
      post :create, flag: { explanation: @flag3.explanation, profile_id: @flag3.profile_id, reason: @flag3.reason }, problem_id: @problem, solution_id: @solution
    end

    assert_redirected_to problem_solution_path(@problem, @solution)
  end

  test "should create problem comment flag" do
    assert_difference('Flag.count') do
      post :create, flag: { explanation: @flag1.explanation, profile_id: @flag1.profile_id, reason: @flag1.reason }, problem_id: @problem, comment_id: @comment1
    end

    assert_redirected_to problem_comment_path(@problem, @comment1)
  end

  test "should create problem solution comment flag" do
    assert_difference('Flag.count') do
      post :create, flag: { explanation: @flag2.explanation, profile_id: @flag2.profile_id, reason: @flag2.reason }, problem_id: @problem, solution_id: @solution, comment_id: @comment2
    end

    assert_redirected_to problem_solution_comment_path(@problem, @solution, @comment2)
  end

  test "should not create problem solution flag" do
    assert_no_difference('Flag.count') do
      post :create, flag: { explanation: @flag3.explanation, profile_id: @flag3.profile_id }, problem_id: @problem, solution_id: @solution
    end

    assert_template :new
  end


  test "should show problem solution flag" do
    get :show, id: @flag3, problem_id: @problem, solution_id: @solution
    assert_response :success
  end

  test "should show problem solution comment flag" do
    get :show, id: @flag2, problem_id: @problem, solution_id: @solution, comment_id: @comment2
    assert_response :success
  end

    test "should show  problem comment flag" do
    get :show, id: @flag1, problem_id: @problem, comment_id: @comment1
    assert_response :success
  end

  test "should destroy problem solution flag" do
    assert_difference('Flag.count', -1) do
      delete :destroy, id: @flag3, problem_id: @problem, solution_id: @solution
    end

    assert_redirected_to problem_solution_path(@problem, @solution)
  end

  test "should destroy problem solution comment flag" do
    assert_difference('Flag.count', -1) do
      delete :destroy, id: @flag2, problem_id: @problem, solution_id: @solution, comment_id: @comment2
    end

    assert_redirected_to problem_solution_comment_path(@problem, @solution, @comment2)
  end

  test "should destroy problem comment flag" do
    assert_difference('Flag.count', -1) do
      delete :destroy, id: @flag1, problem_id: @problem, comment_id: @comment1
    end

    assert_redirected_to problem_comment_path(@problem, @comment1)
  end
end
