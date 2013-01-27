require 'test_helper'

class LangageFamiliesControllerTest < ActionController::TestCase
  setup do
    @langage_family = langage_families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:langage_families)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create langage_family" do
    assert_difference('LangageFamily.count') do
      post :create, langage_family: { description: @langage_family.description, name: @langage_family.name }
    end

    assert_redirected_to langage_family_path(assigns(:langage_family))
  end

  test "should show langage_family" do
    get :show, id: @langage_family
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @langage_family
    assert_response :success
  end

  test "should update langage_family" do
    put :update, id: @langage_family, langage_family: { description: @langage_family.description, name: @langage_family.name }
    assert_redirected_to langage_family_path(assigns(:langage_family))
  end

  test "should destroy langage_family" do
    assert_difference('LangageFamily.count', -1) do
      delete :destroy, id: @langage_family
    end

    assert_redirected_to langage_families_path
  end
end
