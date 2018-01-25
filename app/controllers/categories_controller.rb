class CategoriesController < ApplicationController
   def new
  	@category = Category.new
  end

  def index
  	@category = Category.new
  	@categories = Category.all
  end

  def create
  	@category = Category.new(category_params)
    @category.save
    redirect_to ("/")
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def edit
  end

private
	def category_params
	  params.require(:category).permit(:name)
	end
end


