require "test_helper"

class CreateTaskTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    get new_user_session_path
    sign_in users(:one)
    post user_session_path
    @category = categories(:one)
    @task = tasks(:one)
  end

  test 'should go to new task form and create one' do
    get new_category_task_path(@category)
    assert_response :success

    assert_difference '@category.tasks.count', 1 do
        post category_tasks_path(@category), params:{task: {name:"Task1", description: "SampleTask1", deadline: Date.today.strftime("%B %d, %Y"), journal_id: 1}}
        assert_response :redirect
    end
    follow_redirect!
    assert_response :success
end

  test 'Should show the category you selected and create a task' do
    get category_path(@category)
    assert_response :success

    assert_difference "Task.count" do
      post category_tasks_path(@category), params: {task: {name:"Task1", description: "SampleTask1", deadline: Date.today.strftime("%B %d, %Y")}}
      assert_response :redirect  
    end
    follow_redirect!
    assert_response :success
  end
 
  test 'should delete selected task' do
    get category_path(@category)
    assert_response :success

    assert_difference '@category.tasks.count', -1 do
        delete category_task_path(@category, @task)
        assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
  
end
