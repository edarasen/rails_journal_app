require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "name cannot be null" do
    user = users(:one)
    category = Category.new(name:"", user_id: user.id)
    assert !category.valid?, "Category should have non-null name"
  end
  
  test "belongs to a user" do
    user = users(:one)
    category = Category.new(name:"high", user: user)
    assert category.valid?, "Category should belong to a user"
    assert_equal user, category.user
  end

  test "fixtures saved to database" do
    assert_not_nil categories(:one), "Category :one did not save to database"
  end
  
  test "has many tasks" do
    category = categories(:one)
    category.tasks.create!(name:"high", details:"asdf", due_date:'2025-09-10', category: category)
    assert_equal 1, category.tasks.count
  end
end
