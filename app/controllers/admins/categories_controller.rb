module Admins
  class CategoriesController < AdminController
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def edit
      category
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:success] = 'Created!'
        redirect_to admins_categories_path
      else
        flash[:danger] = 'Incorrect!'
        render 'new'
      end
    end

    def update
      if category.update(category_params)
        flash[:success] = 'Updated!'
        redirect_to admins_categories_path
      else
        flash[:danger] = 'Incorrect!'
        render 'edit'
      end
    end

    def destroy
      category.destroy!
      redirect_to admins_categories_path
    end

    private

    def category_params
      params.require(:category).permit(:name)
    end

    def category
      @category = Category.find(params[:id])
    end
  end
end
