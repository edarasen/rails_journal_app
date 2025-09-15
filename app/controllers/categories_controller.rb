class CategoriesController < ApplicationController
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def index
    @user = current_user
    @categories = @user.categories
    @daily_tasks = []
    @categories.each do |category|
      category.tasks.each do |task|
        if task.due_date == Date.today
          @daily_tasks.push(task)
        end
      end
    end
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.create(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    render :edit
  end

  # def update
  #   @category = Category.find(params[:id])

  #   if @category.update(category_params)
  #     redirect_to categories_path
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :details, :color)
  end

  def not_found
    render plain: "User does not exist", status: :not_found
  end
end
