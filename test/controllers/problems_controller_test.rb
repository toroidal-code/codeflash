require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  setup do
    user = User.create(email: 'lol@lol.lol',
                    username: 'LOLOLOLOLOL',
                    password: 'LOLlol101',
                    admin: true)
    user.skip_confirmation!
    sign_in(user)
    @problem = problems(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:problems)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create problem' do
    assert_difference('Problem.count') do
      post :create, problem: {description: @problem.description,
                              points: @problem.points,
                              name: @problem.name,
                              shortname: 'mystringss' },
                    tags:'MyString,mystring2'
    end

    assert_redirected_to problem_path(assigns(:problem))
  end

  test 'should not create problem' do
    assert_no_difference('Problem.count') do
      post :create, problem: {description: @problem.description,
                              points: @problem.points,
                              name: @problem.name,
                              shortname: @problem.shortname },
                    tags:''
    end

    assert_template :new
  end

  test 'should show problem' do
    get :show, id: @problem
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @problem
    assert_response :success
  end

  test 'should update problem' do
    put :update, id: @problem, problem: { description: @problem.description,
                                          points: @problem.points,
                                          name: @problem.name,
                                          shortname: @problem.shortname },
                               tags:''
    assert_redirected_to problem_path(assigns(:problem))
  end

  test 'should not update problem' do
    put :update, id: @problem, problem: { description: @problem.description,
                                          points: 'string',
                                          name: @problem.name,
                                          shortname: @problem.shortname },
                               tags:''
    assert_template :edit
  end

  test 'should destroy problem' do
    assert_difference('Problem.count', -1) do
      delete :destroy, id: @problem
    end

    assert_redirected_to problems_path
  end
end
