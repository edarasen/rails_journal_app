class TasksController < ApplicationController
  before_action :authenticate_user!

  def show
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @task = @category.tasks.new(task_params)

    if @task.save
      redirect_to category_path(@category.id)
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to category_path(@category.id)
  end

  private
  def task_params
    params.require(:task).permit(:name, :details, :due_date)
  end

end