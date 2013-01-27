require 'test_helper'

class LanguageFamiliesControllerTest < ActionController::TestCase
  setup do
    @language_family = language_families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:language_families)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create language_family" do
    assert_difference('LanguageFamily.count') do
      post :create, language_family: { description: @language_family.description, name: @language_family.name }
    end

    assert_redirected_to language_family_path(assigns(:language_family))
  end

  test "should show language_family" do
    get :show, id: @language_family
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @language_family
    assert_response :success
  end

  test "should update language_family" do
    put :update, id: @language_family, language_family: { description: @language_family.description, name: @language_family.name }
    assert_redirected_to language_family_path(assigns(:language_family))
  end

  test "should destroy language_family" do
    assert_difference('LanguageFamily.count', -1) do
      delete :destroy, id: @language_family
    end

    assert_redirected_to language_families_path
  end
end
