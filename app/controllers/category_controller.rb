class CategoryController < ApplicationController
  before_action :authenticate_user!

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :details, :color)
  end
end