class RecipesController < ApplicationController

def index
	@recipes = Recipe.all
end

def create
	# @recipe = Recipe.conversion(recipe_params[:ingredients])
  @recipe = Recipe.new(recipe_params)
  @recipe.save
  redirect_to @recipe
end

private
	def recipe_params
		params.require(:recipe).permit(:name, :ingredients)
	end

end
