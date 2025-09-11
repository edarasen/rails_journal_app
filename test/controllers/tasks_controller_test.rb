require "test_helper"
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = users(:one)
    sign_in @user
  end 

  #CREATE, READ, UPDATE, DELETE
  test "should create a task" do
    @category = categories(:one)
    assert_difference("Task.count", 1) do
      post create_category_task_path(@category), params:{ task:{name:"hihi", details:"huihui", due_date:"2025-09-11"} }
    end
    assert_redirected_to category_path(@category)
  end

  test "should read a task" do
    @category = categories(:one)
    @task = @category.tasks.create!(name:"hihi", details:"huihui", due_date:"2025-09-11")
    get category_task_path(@category, @task)
    assert_equal "show", @controller.action_name
    assert_response :success
  end

  test "should get edit task form" do
    @category = categories(:one)
    @task = @category.tasks.create!(name:"hihi", details:"huihui", due_date:"2025-09-11")
    get edit_category_task_path(@category, @task)
    assert_equal "edit", @controller.action_name
    assert_response :success
  end

  test "should update a task" do
    @category = categories(:one)
    @task = @category.tasks.create!(name:"hihi", details:"huihui", due_date:"2025-09-11")

    assert_changes '@task.reload.name', from:'hihi', to:'updated' do
      post update_category_task_path(@category, @task), params:{ task:{name:"updated", details:"huihui", due_date:"2025-09-11"} }
    end
    assert_redirected_to category_path(@category)
  end

  test "should destroy a task" do
    @category = categories(:one)
    @task = @category.tasks.create!(name:"hihi", details:"huihui", due_date:"2025-09-11")

    assert_difference("Task.count", -1) do
        delete category_task_path(@category.id, @task.id)
      end
      assert_redirected_to category_path(@category.id)
  end

end