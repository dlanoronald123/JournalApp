require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    get new_user_session_path
    sign_in users(:one)
    post user_session_path
    @category = categories(:one)

  end

  test 'should get all categories' do
    get categories_path
    assert_response :success
  end

  test 'should create new category' do
    get new_category_path
    assert_response :success
  end

  test 'should show category' do
    get category_path(@category)
    assert_response :success

  end
  test 'should edit category' do
    get edit_category_path(@category)
    assert_response :success

  end

  test 'should update category' do
    patch category_path(@category), params: { category: {name:"Category1", description: "SampleBody"}}
    assert_response :redirect
  end

  test 'should delete category' do
    delete category_path(@category)
    assert_response :redirect

  end
end
