require "test_helper"
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  # CREATE, READ, UPDATE, DELETE
  test "should get index" do
    get categories_path
    assert_equal "index", @controller.action_name
    assert_response :success
  end

  test "should get new category form" do
    get new_category_path
    assert_equal "new", @controller.action_name
    assert_response :success
  end

  test "should create a category" do
      assert_difference("Category.count", 1) do
        post create_category_path, params: { category: { name: "hihi", details: "huihui", color: "#FFC300", user: @user } }
      end
      assert_redirected_to categories_path
  end

  test "should read a category" do
    get category_path(Category.first)
    assert_equal "show", @controller.action_name
    assert_response :success
  end

  test "should get edit category form" do
    @category = categories(:one)
    get edit_category_path(@category.id)
    assert_equal "edit", @controller.action_name
    assert_response :success
  end

  test "should update a category" do
    @category = @user.categories.create!(name: "hihi", details: "huihui", color: "#FFC300")

    assert_changes "@category.reload.name", from: "hihi", to: "updated" do
      post update_category_path(@category), params: { category: { name: "updated", details: "huihui", color: "#FFC300", user: @user } }
    end
    assert_redirected_to categories_path
  end

  test "should destroy a category" do
    @category = @user.categories.create!(name: "hihi", details: "huihui", color: "#FFC300")

    assert_difference("Category.count", -1) do
        delete category_path(@category.id)
      end
      assert_redirected_to categories_path
  end
end
