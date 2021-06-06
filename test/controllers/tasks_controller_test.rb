require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    get new_user_session_path
    sign_in users(:one)
    post user_session_path
    @category = categories(:one)
    @task = tasks(:one)
  end

  
  test 'should get all tasks' do
    get category_tasks_path(@category)
    assert_response :success
  end

  test 'should get new task form from category' do
    get new_category_task_path(@category)
    assert_response :success
  end


  test 'should create task' do
    assert_difference 'Task.count', 1 do
      post category_tasks_path(@category), params:{task: {name: 'Task1', description: 'SampleTask1', deadline: Date.today}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end

  test 'should show selected task' do
    get category_task_path(@category, @task)
    assert_response :success

  end
  test 'should edit a task' do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test 'should update selected task' do
    patch category_task_path(@category.id, @task.id), params:{task: {name: 'Create New Task', description: 'description description', deadline: Date.today}}
    assert_response :redirect
  end

  test 'should delete selected task' do
    delete category_task_path(@category, @task)
    assert_redirected_to category_tasks_path(@category)
  end

end