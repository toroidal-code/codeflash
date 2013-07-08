require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @request.env['HTTP_REFERER'] = 'http://test.host/'
    user = User.create(email: 'lol@lol.lol',
                    username: 'LOLOLOLOLOL',
                    password: 'LOLlol101',
                    admin: true)
    user.skip_confirmation!
    sign_in(user)
    @problem = problems(:one)
    @problem
    @solution = solutions(:one)
    @solution.problem = @problem
    @solution.profile = user.profile
    @solution.save
    @profile = user.profile
    @comment = comments(:one)
    @comment2 = comments(:two)
    @comment2.commentable = @solution
    @comment2.profile = @profile
    @comment.profile = @profile
    @comment.commentable = @problem
    @comment.save
    @comment2.save
  end

  test 'should create problem comment' do
    assert_difference('Comment.count') do
      post :create, comment: {body: @comment.body},
                    problem_id: @problem.shortname
    end
    assert_redirected_to problem_path(@problem)
  end

  test 'should create solution comment' do
    assert_difference('Comment.count') do
      post :create, comment: {body: @comment.body},
                    problem_id: @problem.shortname,
                    solution_id: @solution
    end
    assert_redirected_to problem_solution_path(@problem, @solution)
  end

  test 'should show problem comment' do
    get :show, id: @comment, problem_id: @problem
    assert_response :success
  end

  test 'should show solution comment' do
    get :show, id: @comment2, problem_id: @problem, solution_id: @solution
    assert_response :success
  end

  test 'should upvote problem comment' do
    assert_difference('Comment.find(@comment).up_votes') do
      put :upvote, problem_id: @problem, id: @comment
    end
    assert_redirected_to :back
    assert_no_difference('Comment.find(@comment).up_votes') do
      put :upvote, problem_id: @problem, id: @comment
    end
    assert_equal 'You have already voted on this comment.', flash[:error]
    assert_redirected_to :back
  end

  test 'should downvote problem comment' do
    assert_difference('Comment.find(@comment).down_votes') do
      put :downvote, problem_id: @problem, id: @comment
    end
    assert_redirected_to :back
    assert_no_difference('Comment.find(@comment).down_votes') do
      put :downvote, problem_id: @problem, id: @comment
    end
    assert_equal 'You have already voted on this comment.', flash[:error]
    assert_redirected_to :back
  end

  test 'should upvote solution comment' do
    assert_difference('Comment.find(@comment2).up_votes') do
      put :upvote, problem_id: @problem, solution_id: @solution, id: @comment2
    end
    assert_redirected_to :back
    assert_no_difference('Comment.find(@comment2).up_votes') do
      put :upvote, problem_id: @problem, solution_id: @solution, id: @comment2
    end
    assert_equal 'You have already voted on this comment.', flash[:error]
    assert_redirected_to :back
  end

  test 'should downvote solution comment' do
    assert_difference('Comment.find(@comment2).down_votes') do
      put :downvote, problem_id: @problem, solution_id: @solution, id: @comment2
    end
    assert_redirected_to :back
    assert_no_difference('Comment.find(@comment2).down_votes') do
      put :downvote, problem_id: @problem, solution_id: @solution, id: @comment2
    end
    assert_equal 'You have already voted on this comment.', flash[:error]
    assert_redirected_to :back
  end
end
