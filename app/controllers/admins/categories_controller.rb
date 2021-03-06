class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admins_categories_path
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admins_categories_path
  end
end

private

def category_params
  params.require(:category).permit(:name)
end
