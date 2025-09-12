class CategoryController < ApplicationController
  # helper_method :current_category, :category_selected?
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

  # def current_category
  #   @current_category ||= Category.find_by(id: category_id)
  # end
  # def category_selected?
  #   current_category != nil
  # end
end
