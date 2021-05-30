require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test 'Should not save task without name' do
    categories = Category.new
    categories.name = "Sample Name"
    categories.description = "Sample Description"
    categories.save

    tasks = Task.new
    tasks.description = "Sample task description"
    tasks.deadline = Date.today
    assert_not tasks.save, 'Saved task without name'
  end

  test 'Should not save task without description' do
    categories = Category.new
    categories.name = "Sample Name"
    categories.description = "Sample Description"
    categories.save

    tasks = Task.new
    tasks.name = "Sample task name"
    tasks.deadline = Date.today
    assert_not tasks.save, 'Saved task without description'
  end

  test 'Should not save task without date' do
    categories = Category.new
    categories.name = "Sample Name"
    categories.description = "Sample Description"
    categories.save

    tasks = Task.new
    tasks.name = "Sample task name"
    tasks.description = "Sample task description"
    assert_not tasks.save, 'Saved task without description'
  end
end
