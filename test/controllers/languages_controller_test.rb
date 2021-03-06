require 'test_helper'

class LanguagesControllerTest < ActionController::TestCase
  setup do
    user = User.create(email: "lol@lol.lol",
                    username: "LOLOLOLOLOL",
                    password: "LOLlol101",
                    admin: true)
    user.skip_confirmation!
    sign_in(user)
    @language = languages(:one)
    @language.name = 'unique name'
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:languages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create language" do
    assert_difference('Language.count') do
      post :create, language: { name: @language.name,
                                ace_syntax: @language.ace_syntax,
                                pygments_syntax: @language.pygments_syntax }
    end

    assert_redirected_to language_path(assigns(:language))
  end

  test "should not create language" do
    assert_no_difference('Language.count') do
      post :create, language: { ace_syntax: @language.ace_syntax,
                                pygments_syntax: @language.pygments_syntax }
    end

    assert_template :new
  end

  test "should show language" do
    get :show, id: @language
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @language
    assert_response :success
  end

  test "should update language" do
    put :update, id: @language, language: { name: @language.name }
    assert_redirected_to language_path(assigns(:language))
  end

  test "should not update language" do
    put :update, id: @language, language: { name: languages(:two).name }
    assert_template :edit
  end

  test "should destroy language" do
    assert_difference('Language.count', -1) do
      delete :destroy, id: @language
    end

    assert_redirected_to languages_path
  end
end
