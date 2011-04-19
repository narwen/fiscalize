class CategoriesController < ApplicationController
  expose(:categories) { Category.scoped{} } #Category.scoped{}
  expose(:category)
  
  def create
    redirect_to [:categories], notice: "Category was created."
  end
end
