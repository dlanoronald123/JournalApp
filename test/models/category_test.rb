require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test 'valid user' do
    categories = Category.new(name: 'John', description: 'john@example.com')
    assert categories.valid?
  end

  test 'Should not save category without name' do
    categories = Category.new
    categories.description = "Sample Description"

    assert_not categories.save, 'Saved category without name'
  end

  test 'Should not save category without description' do
    categories = Category.new
    categories.name = "Sample Name"

    assert_not categories.save, 'Saved category without description'
  end
end
