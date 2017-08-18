class CategoriesController < JSONAPI::ResourceController

  def destroy
    category = Category.find(params[:id])
    if category.products.empty?
      category.destroy
      render json: {status: 200}
    else
      render json: {status: 403, error: 'Category cannot be deleted if it has products.'}
    end
  end
end
