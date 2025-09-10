require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user should have non-null email" do
    user = User.new(email: "", encrypted_password: "asdf")
    assert !user.valid?, "User should have non-null email"
  end

  test "user should have non-null password" do
    user = User.new(email: "asdf", encrypted_password: "")
    assert !user.valid?, "User should have non-null password"
  end

  test "fixtures save to database" do
    assert_not_nil users(:one), "User :one did not save to database"
    assert_not_nil users(:two), "User :two did not save to database"
  end

  test "has many categories" do
    user = users(:one)
    user.categories.create!(name: "high", user: user)
    assert_equal 1, user.categories.count
  end
end
