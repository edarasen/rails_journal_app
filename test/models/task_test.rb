require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "name cannot be null" do
    category = categories(:one)
    task = Task.new(name:"", category: category)
    assert !task.valid?, "Task should have non-null name"
  end
  
  test "belongs to a category" do
    category = categories(:one)
    task = Task.new(name:"asdf", category: category)
    assert task.valid?, "Task should belong to a category"
    assert_equal category, task.category
  end
end
