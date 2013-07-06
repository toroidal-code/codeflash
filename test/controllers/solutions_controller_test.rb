require 'test_helper'

class SolutionsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_REFERER'] = 'http://test.host/solutions/show'
    @user = User.create(email: "lol@lol.lol",
                    username: "LOLOLOLOLOL",
                    password: "LOLlol101",
                    admin: true)
    @user.skip_confirmation!
    sign_in(@user)
    @problem = problems(:one)
    @solution = solutions(:one)
    @solution.problem = @problem
    @solution.profile = @user.profile
    @solution.language = languages(:one)
    @solution.save
    @solution2 = solutions(:two)
    @solution2.problem = @problem
    @solution2.profile = @user.profile
    @solution2.language = languages(:two)
    @solution2.save

  end

  test "should get index" do
    get :index, problem_id: @problem
    assert_response :success
    assert_not_nil assigns(:solutions)
  end

  test "should get all index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:solutions)
  end

  test "should get new" do
    get :new, problem_id: @problem
    assert_response :success
  end

  test "should create solution" do
    assert_difference('Solution.count') do
      post :create, problem_id: @problem, solution: { code: @solution.code,
                                                      down_votes: @solution.down_votes,
                                                      up_votes: @solution.up_votes,
                                                      problem_id: @problem}
    end
    assert_redirected_to problem_solution_path(@problem, assigns(:solution))
  end

  test "should not create solution without code" do
    assert_no_difference('Solution.count') do
      post :create, problem_id: @problem, solution: {down_votes: @solution.down_votes,
                                                   up_votes: @solution.up_votes,
                                                   problem_id: @problem}
   end
   assert_template :new
  end

  test "should show solution" do
    get :show, {problem_id: @problem, id: @solution}
    assert_response :success
  end

  test "should get edit" do
    get :edit, {problem_id: @problem, id: @solution}
    assert_response :success
  end

  test "should update solution" do
    put :update, problem_id: @problem, id: @solution, solution: { code: @solution.code,
                                            down_votes: @solution.down_votes,
                                            up_votes: @solution.up_votes,
                                            problem_id: @problem }
    assert_redirected_to problem_solution_path(@problem, assigns(:solution))
  end

  test "should not update solution" do
    put :update, problem_id: @problem, id: @solution, solution: { code: @solution.code,
                                            down_votes: "string",
                                            up_votes: @solution.up_votes,
                                            problem_id: @problem }
    assert_template :edit
  end

  test "should destroy solution" do
    assert_difference('Solution.count', -1) do
      delete :destroy, {problem_id: @problem, id: @solution}
    end

    assert_redirected_to problem_solutions_path(@problem)
  end

  test "should upvote solution" do
    assert_difference('Solution.find(@solution).up_votes') do
      put :upvote, problem_id: @problem, id: @solution
    end
    assert_redirected_to :back
    assert_no_difference('Solution.find(@solution).up_votes') do
      put :upvote, problem_id: @problem, id: @solution
    end
    assert_equal 'You have already voted on this solution.', flash[:error]
    assert_redirected_to :back
  end

  test "should downvote solution" do
    assert_difference('Solution.find(@solution).up_votes') do
      put :upvote, problem_id: @problem, id: @solution
    end
    assert_difference('Solution.find(@solution).up_votes', -1) do
      put :downvote, problem_id: @problem, id: @solution
    end
    assert_redirected_to :back
    assert_no_difference('Solution.find(@solution).up_votes') do
      put :downvote, problem_id: @problem, id: @solution
    end
    assert_equal 'You have already voted on this solution.', flash[:error]
    assert_redirected_to :back
  end
end
