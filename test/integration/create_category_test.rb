require "test_helper"

class CreateJournalTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    def setup
      get new_user_session_path
      sign_in users(:one)
      post user_session_path
      @category = categories(:one)
      @task = tasks(:one)
    end
    
    test 'Should go to new category form and able to create one' do
        get new_category_path
        assert_response :success

        assert_difference 'Category.count', 1 do
            post categories_path, params: { category: {name:"Sample", description: "SampleBody"}}

        assert_response :redirect
        
        end
        follow_redirect!
        assert_response :success
    end

    test 'Should edit and update the category selected' do
        get edit_category_path(@category)
        assert_response :success
       
        patch category_path(@category.id), params: {category: {name: 'Category1', description: "SampleBody"}}
        assert_response :redirect
        
        follow_redirect!
        assert_response :success
    end

end