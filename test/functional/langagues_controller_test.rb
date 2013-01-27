require 'test_helper'

class LangaguesControllerTest < ActionController::TestCase
  setup do
    @langague = langagues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:langagues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create langague" do
    assert_difference('Langague.count') do
      post :create, langague: { name: @langague.name }
    end

    assert_redirected_to langague_path(assigns(:langague))
  end

  test "should show langague" do
    get :show, id: @langague
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @langague
    assert_response :success
  end

  test "should update langague" do
    put :update, id: @langague, langague: { name: @langague.name }
    assert_redirected_to langague_path(assigns(:langague))
  end

  test "should destroy langague" do
    assert_difference('Langague.count', -1) do
      delete :destroy, id: @langague
    end

    assert_redirected_to langagues_path
  end
end
