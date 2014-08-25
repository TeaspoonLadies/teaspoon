class RecipesController < ApplicationController

def index
	@recipes = Recipe.all
end

def new
  @recipe = Recipe.new
end

def create
  @recipe = Recipe.new(recipe_params)
  @recipe.save
  respond_to do |format|
    if @recipe.save
      format.html { redirect_to 'index', notice: 'recipe was successfully created.' }
      format.json { render action: 'index', status: :created }
      format.js {}
    else
      # format.html { render action: 'index' }
      # format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @recipe = Recipe.find(params[:id])
end

private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

	def recipe_params
		params.require(:recipe).permit(:name, :ingredients, :shopping_list_ids => [], :shopping_lists_attributes => [:recipe_id, :content])
	end

end
