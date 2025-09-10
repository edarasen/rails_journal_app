class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @categories = @user.categories
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end

  # =====

  # def show
  #   @author = Author.find(params[:id])
  #   @articles = @author.articles
  # end

  # def new
  #   @author = Author.new
  # end

  # def create
  #   @author = Author.new(author_params)

  #   if @author.save
  #     redirect_to authors_path
  #   else
  #     render :new
  #   end
  # end

  # def edit
  #   @author = Author.find(params[:id])
  #   render :edit
  # end

  # def update
  #   @author = Author.find(params[:id])

  #   if @author.update(author_params)
  #     redirect_to authors_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @author = Author.find(params[:id])
  #   @author.destroy
  #   redirect_to authors_path
  # end

  # private
  # def author_params
  #   params.require(:author).permit(:name)
  # end
end
