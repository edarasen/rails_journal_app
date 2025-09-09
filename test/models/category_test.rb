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
end
